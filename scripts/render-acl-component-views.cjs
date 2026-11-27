// Render the two ACL detail views from the shared Structurizr model.
// Usage: node scripts/render-acl-component-views.cjs <path-to-plantuml.jar>
// Requires Java and PlantUML (with Graphviz available).
const fs = require('node:fs');
const path = require('node:path');
const { spawnSync } = require('node:child_process');
const root = path.resolve(__dirname, '..');
const base = path.join(root, 'assets/Images Chapter 4/Domain-Driven Software Architecture/C4 Model');
const jar = process.argv[2];
if (!jar || !fs.existsSync(jar)) throw new Error('Supply the path to a local PlantUML JAR.');
const read = name => fs.readFileSync(path.join(base, name), 'utf8');
const model = read('backend-components.dsl');
const elements = new Map();
let context = '', layer = '';
for (const line of model.split(/\r?\n/)) {
  const group = line.match(/^(\s*)group "([^"]+)"/);
  if (group) {
    if (!group[1].length) { context = group[2]; layer = ''; }
    else layer = group[2];
  }
  const component = line.match(/^\s*(\w+) = component "([^"]+)" "([^"]+)" "([^"]+)"/);
  if (component) elements.set('molinex.apiApplication.' + component[1], {
    name: component[2], description: component[3], technology: component[4], context, layer,
    acl: /^(productionAclInterfaces|productionAclImplementation|qualityProductionAcl)$/.test(component[1])
  });
}
elements.set('molinex.webApplication', {name:'Single-Page Application', technology:'Angular / JSON over HTTPS', description:'Browser client for operational management.'});
elements.set('molinex.database', {name:'Relational Database', technology:'MySQL', description:'Logical ownership of stored data by module.'});
const relations = [...read('relationships.dsl').matchAll(/^(\S+) -> (\S+) "([^"]+)"(?: "([^"]+)")?/gm)];
const views = read('views.dsl');
const alias = id => id.replaceAll('.', '_');
const escape = value => value.replaceAll('"', "'");
function wrap(value, limit = 46) {
  const lines = [''];
  for (const word of value.split(/\s+/)) {
    if (lines.at(-1).length + word.length + 1 > limit && lines.at(-1)) lines.push(word);
    else lines[lines.length-1] += (lines.at(-1) ? ' ' : '') + word;
  }
  return lines.map(escape).join('\\n');
}
for (const [key, file] of [
  ['MolinexBackendProduction', 'backend-production-management-component-diagram.svg'],
  ['MolinexBackendQuality', 'backend-quality-yield-control-component-diagram.svg']
]) {
  const view = views.match(new RegExp('component molinex\\.apiApplication "'+key+'" \\{([\\s\\S]*?)\\n\\}'));
  if (!view) throw new Error('Missing view ' + key);
  const ids = [...view[1].matchAll(/^\s*include (.+)$/gm)].flatMap(m => m[1].trim().split(/\s+/));
  for (const id of ids) if (!elements.has(id)) throw new Error('Unknown model element '+id);
  const title = view[1].match(/title "([^"]+)"/)[1];
  const lines = [
    '@startuml', 'top to bottom direction', 'skinparam backgroundColor #FFFFFF',
    'skinparam shadowing false', 'skinparam defaultFontName Arial', 'skinparam defaultFontSize 13',
    'skinparam packageStyle rectangle', 'skinparam ArrowColor #526D82',
    'skinparam rectangleBorderColor #607D8B', 'skinparam packageBorderColor #8296A8',
    'skinparam nodesep 65', 'skinparam ranksep 75', 'hide stereotype',
    'title '+title, 'caption',
    'Amber: implemented published contract, facade implementation and consumer ACL.',
    'Other components retain the target design.', 'endcaption',
  ];
  const render = id => {
    const item = elements.get(id);
    const color = item.acl ? '#FFE4B5' : ({Interfaces:'#DCEEF8',Application:'#B9DDF2',Domain:'#CFE5A8',Infrastructure:'#E4D5F7'}[item.layer] || '#F0F5FA');
    lines.push(`rectangle "**${wrap(item.name, 38)}**\\n[${id.startsWith('molinex.apiApplication.')?'Component':'Container'}: ${wrap(item.technology,44)}]\\n\\n${wrap(item.description)}" as ${alias(id)} ${color}`);
  };
  ids.filter(id => !id.startsWith('molinex.apiApplication.')).forEach(render);
  lines.push('package "RESTful API [Container: Java / Spring Boot]" #FCFDFE {');
  const contexts = [...new Set(ids.filter(id => elements.get(id).context).map(id => elements.get(id).context))];
  for (const name of contexts) {
    const contextAlias = name.replace(/[^A-Za-z0-9]/g, '_');
    lines.push('package "'+name+'" as context_'+contextAlias+' #FCFDFE {');
    for (const layerName of ['Interfaces','Application','Domain','Infrastructure']) {
      const members = ids.filter(id => elements.get(id).context===name && elements.get(id).layer===layerName);
      if (!members.length) continue;
      lines.push('package "'+layerName+'" as layer_'+contextAlias+'_'+layerName+' #FCFDFE {');
      members.forEach(render);
      lines.push('}');
    }
    lines.push('}');
  }
  lines.push('}');
  const selected = new Set(ids);
  for (const [,source,target,label,technology] of relations) {
    if (!selected.has(source) || !selected.has(target)) continue;
    lines.push(`${alias(source)} ..> ${alias(target)} : ${wrap(label,32)}${technology ? '\\n['+escape(technology)+']' : ''}`);
  }
  lines.push('@enduml');
  const result = spawnSync('java', ['-DPLANTUML_LIMIT_SIZE=24000','-jar',jar,'-charset','UTF-8','-tsvg','-pipe'], {input:lines.join('\n'), encoding:'utf8', maxBuffer:32*1024*1024});
  if (result.status!==0 || !result.stdout.includes('<svg') || result.stdout.includes('Syntax Error')) {
    throw new Error('PlantUML failed: '+result.stderr+'\n'+result.stdout.slice(0,500));
  }
  fs.writeFileSync(path.join(base,file),result.stdout,'utf8');
  console.log('Rendered '+file+' from '+ids.length+' model elements.');
}
