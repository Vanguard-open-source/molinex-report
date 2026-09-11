<div align="center">

<img src="assets/front-matter/upc-logo.png" width="110" alt="Logo de la Universidad Peruana de Ciencias Aplicadas">

**Universidad Peruana de Ciencias Aplicadas**<br>
**Carrera de Ingeniería de Software**<br>
**Ciclo académico 2026-20**

**1ASI0729**<br>
**Desarrollo de Aplicaciones Open Source**

**NRC 7753**

**Profesor**<br>
**Bautista Ubillús, Efraín Ricardo**

# Informe de Trabajo Final

**Startup: Vanguard**<br>
**Producto: Molinex**

## Integrantes

| Código | Apellidos y nombres |
|:--:|:--|
| u202424008 | Casalino Berrocal, Luisa Nhiriel |
| u202424466 | Gallegos De La Cruz, Giovanni Marcelo |
| u20241e550 | Huerta Cardenas, Brayan Benjamin |
| u202420031 | Jimenez Saavedra, Antony Alexander |
| u202423883 | Rivera Rupay, Fabricio Jose |

**Septiembre de 2026**

</div>

<div style="page-break-after: always;"></div>

## Registro de Versiones del Informe

| Versión | Fecha | Autor | Descripción de la modificación |
|:--:|:--:|:--|:--|
| AV1 | [fecha] | [autor(es)] | [describir qué se agregó/cambió en esta versión] |

<div style="page-break-after: always;"></div>

## Project Report Collaboration Insights

[Explicar cómo se desarrollan las actividades de elaboración del informe. Esta sección se expande en cada entrega.]

### Repositorios del proyecto

- Project Report: `https://github.com/Vanguard-open-source/molinex-report`
- Landing Page: `https://github.com/Vanguard-open-source/molinex-website`
- Frontend Web Application: `https://github.com/Vanguard-open-source/molinex-webapp`
- RESTful API: `https://github.com/Vanguard-open-source/molinex-platform`

### Entrega AV1

[Resumen de lo avanzado en esta entrega.]

#### Participación del equipo

- Casalino Berrocal, Luisa Nhiriel: [responsabilidades]
- Gallegos De La Cruz, Giovanni Marcelo: [responsabilidades]
- Huerta Cardenas, Brayan Benjamin: [responsabilidades]
- Jimenez Saavedra, Antony Alexander: [responsabilidades]
- Rivera Rupay, Fabricio Jose: [responsabilidades]

#### Evidencias de colaboración y commits

[Capturas de GitHub Insights y tabla de commits por repositorio.]

<div style="page-break-after: always;"></div>

## Contenido

- [Student Outcome](#student-outcome)
- [Capítulo I Introducción](#capítulo-i-introducción)
- [1.1 Startup Profile](#11-startup-profile)
  - [1.1.1 Descripción de la Startup](#111-descripción-de-la-startup)
  - [1.1.2 Perfiles de integrantes del equipo](#112-perfiles-de-integrantes-del-equipo)
- [1.2 Solution Profile](#12-solution-profile)
  - [1.2.1 Antecedentes y problemática](#121-antecedentes-y-problemática)
  - [1.2.2 Lean UX Process](#122-lean-ux-process)
    - [1.2.2.1 Lean UX Problem Statements](#1221-lean-ux-problem-statements)
    - [1.2.2.2 Lean UX Assumptions](#1222-lean-ux-assumptions)
    - [1.2.2.3 Lean UX Hypothesis Statements](#1223-lean-ux-hypothesis-statements)
    - [1.2.2.4 Lean UX Canvas](#1224-lean-ux-canvas)
- [1.3 Segmentos objetivo](#13-segmentos-objetivo)
- [Capítulo II Requirements Elicitation & Analysis](#capítulo-ii-requirements-elicitation-analysis)
- [2.1 Competidores](#21-competidores)
  - [2.1.1 Análisis competitivo](#211-análisis-competitivo)
  - [2.1.2 Estrategias y tácticas frente a competidores](#212-estrategias-y-tácticas-frente-a-competidores)
- [2.2 Entrevistas](#22-entrevistas)
  - [2.2.1 Diseño de entrevistas](#221-diseño-de-entrevistas)
  - [2.2.2 Registro de entrevistas](#222-registro-de-entrevistas)
  - [2.2.3 Análisis de entrevistas](#223-análisis-de-entrevistas)
- [2.3 Needfinding](#23-needfinding)
  - [2.3.1 User Personas](#231-user-personas)
  - [2.3.2 User Task Matrix](#232-user-task-matrix)
  - [2.3.3 User Journey Mapping](#233-user-journey-mapping)
  - [2.3.4 Empathy Mapping](#234-empathy-mapping)
- [2.4 Big Picture Event Storming](#24-big-picture-event-storming)
- [2.5 Ubiquitous Language](#25-ubiquitous-language)
- [Capítulo III Requirements Specification](#capítulo-iii-requirements-specification)
- [3.1 User Stories](#31-user-stories)
- [3.2 Impact Mapping](#32-impact-mapping)
- [3.3 Product Backlog](#33-product-backlog)
- [Capítulo IV Product Design](#capítulo-iv-product-design)
- [4.1 Style Guidelines](#41-style-guidelines)
  - [4.1.1 General Style Guidelines](#411-general-style-guidelines)
  - [4.1.2 Web Style Guidelines](#412-web-style-guidelines)
- [4.2 Information Architecture](#42-information-architecture)
  - [4.2.1 Organization Systems](#421-organization-systems)
  - [4.2.2 Labeling Systems](#422-labeling-systems)
  - [4.2.3 SEO Tags and Meta Tags](#423-seo-tags-and-meta-tags)
  - [4.2.4 Searching Systems](#424-searching-systems)
  - [4.2.5 Navigation Systems](#425-navigation-systems)
- [4.3 Landing Page UI Design](#43-landing-page-ui-design)
  - [4.3.1 Landing Page Wireframe](#431-landing-page-wireframe)
  - [4.3.2 Landing Page Mockup](#432-landing-page-mockup)
- [4.4 Web Applications UX/UI Design](#44-web-applications-uxui-design)
  - [4.4.1 Web Applications Wireframes](#441-web-applications-wireframes)
  - [4.4.2 Web Applications Wireflow Diagrams](#442-web-applications-wireflow-diagrams)
  - [4.4.3 Web Applications Mockups](#443-web-applications-mockups)
  - [4.4.4 Web Applications User Flow Diagrams](#444-web-applications-user-flow-diagrams)
- [4.5 Web Applications Prototyping](#45-web-applications-prototyping)
- [4.6 Domain-Driven Software Architecture](#46-domain-driven-software-architecture)
  - [4.6.1 Design-Level Event Storming](#461-design-level-event-storming)
  - [4.6.2 Software Architecture Context Diagram](#462-software-architecture-context-diagram)
  - [4.6.3 Software Architecture Container Diagrams](#463-software-architecture-container-diagrams)
  - [4.6.4 Software Architecture Components Diagrams](#464-software-architecture-components-diagrams)
- [4.7 Software Object-Oriented Design](#47-software-object-oriented-design)
  - [4.7.1 Class Diagrams](#471-class-diagrams)
- [4.8 Database Design](#48-database-design)
  - [4.8.1 Database Diagrams](#481-database-diagrams)
- [Capítulo V Product Implementation, Validation & Deployment](#capítulo-v-product-implementation-validation-deployment)
- [5.1 Software Configuration Management](#51-software-configuration-management)
  - [5.1.1 Software Development Environment Configuration](#511-software-development-environment-configuration)
  - [5.1.2 Source Code Management](#512-source-code-management)
  - [5.1.3 Source Code Style Guide & Coding Conventions](#513-source-code-style-guide-coding-conventions)
  - [5.1.4 Software Deployment Configuration](#514-software-deployment-configuration)
- [5.2 Landing Page, Services & Applications Implementation](#52-landing-page-services-applications-implementation)
  - [5.2.1 Sprint 1](#521-sprint-1)
    - [5.2.1.1 Sprint Planning 1](#5211-sprint-planning-1)
    - [5.2.1.2 Aspect Leaders and Collaborators](#5212-aspect-leaders-and-collaborators)
    - [5.2.1.3 Sprint Backlog 1](#5213-sprint-backlog-1)
    - [5.2.1.4 Development Evidence for Sprint Review](#5214-development-evidence-for-sprint-review)
    - [5.2.1.5 Execution Evidence for Sprint Review](#5215-execution-evidence-for-sprint-review)
    - [5.2.1.6 Services Documentation Evidence for Sprint Review](#5216-services-documentation-evidence-for-sprint-review)
    - [5.2.1.7 Software Deployment Evidence for Sprint Review](#5217-software-deployment-evidence-for-sprint-review)
    - [5.2.1.8 Team Collaboration Insights during Sprint](#5218-team-collaboration-insights-during-sprint)
- [Conclusiones](#conclusiones)
- [Conclusiones y recomendaciones](#conclusiones-y-recomendaciones)
- [Bibliografía](#bibliografía)
- [Anexos](#anexos)
- [Anexo A. Videos de Exposiciones](#anexo-a-videos-de-exposiciones)

<div style="page-break-after: always;"></div>

## Student Outcome

El curso contribuye al cumplimiento del Student Outcome ABET:

**ABET – EAC - Student Outcome 3**

Criterio: Capacidad de comunicarse efectivamente con un rango de audiencias.

En el siguiente cuadro se describen las acciones realizadas y los enunciados de conclusiones por parte del grupo, que permiten sustentar el haber alcanzado el logro del ABET – EAC - Student Outcome 3.

| Criterio específico | Acciones realizadas | Conclusiones |
|:--|:--|:--|
| Comunica oralmente con efectividad a diferentes rangos de audiencia. | [Apellidos, Nombres]<br>**AV1**<br>[acciones realizadas por esta persona en esta entrega] | [conclusión grupal acumulable] |
| Comunica por escrito con efectividad a diferentes rangos de audiencia. | [Apellidos, Nombres]<br>**AV1**<br>[acciones realizadas por esta persona en esta entrega] | [conclusión grupal acumulable] |

<div style="page-break-after: always;"></div>

# Capítulo I Introducción

## 1.1 Startup Profile

### 1.1.1 Descripción de la Startup 

### 1.1.1 Descripción de la Startup
Vanguard es una startup tecnológica que desarrolla soluciones digitales para optimizar las operaciones de los molinos de arroz. Su plataforma web, basada en el modelo SaaS, integra y analiza datos de producción, calidad, mantenimiento y materia prima para detectar anomalías, identificar posibles causas de pérdidas y generar recomendaciones que mejoren el rendimiento operativo.

Molinex está dirigida a molinos pequeños, medianos y grandes, y ofrece tres planes de suscripción: Básico, Profesional y Empresarial, adaptados a las necesidades de cada cliente.

Misión: Ayudar a los molinos de arroz a mejorar su eficiencia mediante el análisis inteligente de sus datos operativos.

Visión: Ser una plataforma líder en inteligencia operativa para la industria arrocera en el Perú y Latinoamérica.

Valores:

Innovación: Crear soluciones tecnológicas para la industria.
Eficiencia: Optimizar recursos y procesos.
Transparencia: Ofrecer información confiable.
Compromiso: Promover la mejora continua.
Sostenibilidad: Reducir pérdidas y desperdicios.

**Molinex** es una startup tecnológica que desarrolla soluciones digitales para optimizar las operaciones de los molinos de arroz. Su plataforma web, basada en el modelo **SaaS**, integra y analiza datos de producción, calidad, mantenimiento y materia prima para detectar anomalías, identificar posibles causas de pérdidas y generar recomendaciones que mejoren el rendimiento operativo.

Molinex está dirigida a molinos pequeños, medianos y grandes, y ofrece tres planes de suscripción: **Básico, Profesional y Empresarial**, adaptados a las necesidades de cada cliente.

**Misión:**
Ayudar a los molinos de arroz a mejorar su eficiencia mediante el análisis inteligente de sus datos operativos.

**Visión:**
Ser una plataforma líder en inteligencia operativa para la industria arrocera en el Perú y Latinoamérica.

**Valores:**

* **Innovación:** Crear soluciones tecnológicas para la industria.
* **Eficiencia:** Optimizar recursos y procesos.
* **Transparencia:** Ofrecer información confiable.
* **Compromiso:** Promover la mejora continua.
* **Sostenibilidad:** Reducir pérdidas y desperdicios.


### 1.1.2 Perfiles de integrantes del equipo

| Nombre completo | Código | Carrera | Fotografía | Conocimientos y habilidades |
|:--|:--:|:--|:--:|:--|
| Casalino Berrocal, Luisa Nhiriel | u202424008 | Ingeniería de Software, UPC | <img src="assets/team/luisa-casalino.jpg" width="120" alt="Luisa Casalino"> | [resumen en primera persona] |
| Gallegos De La Cruz, Giovanni Marcelo | u202424466 | Ingeniería de Software, UPC | <img src="assets/team/giovanni-gallegos.jpg" width="120" alt="Giovanni Gallegos"> | [resumen en primera persona] |
| Huerta Cardenas, Brayan Benjamin | u20241e550 | Ingeniería de Software, UPC | <img src="assets/team/brayan-huerta.jpg" width="120" alt="Brayan Huerta"> | [resumen en primera persona] |
| Jimenez Saavedra, Antony Alexander | u202420031 | Ingeniería de Software, UPC | <img src="assets/team/antony-jimenez.jpg" width="120" alt="Antony Jimenez"> | [resumen en primera persona] |
| Rivera Rupay, Fabricio Jose | u202423883 | Ingeniería de Software, UPC | <img src="assets/team/fabricio-rivera.jpg" width="120" alt="Fabricio Rivera"> | [resumen en primera persona] |

## 1.2 Solution Profile

### 1.2.1 Antecedentes y problemática

En los molinos de arroz, el proceso productivo genera información relacionada con la materia prima, producción, calidad, mantenimiento y rendimiento de las máquinas. Sin embargo, esta información suele encontrarse dispersa o utilizarse únicamente para visualizar indicadores, dificultando la identificación de las causas de problemas como el aumento del arroz quebrado, la merma, las fallas de maquinaria y la disminución del rendimiento.

Para analizar preliminarmente la problemática, se aplicó la técnica de las 5W2H:

| Elemento 5W2H | Definición para Molinex |
|:--|:--|
| Who | A los propietarios, administradores, supervisores, técnicos de mantenimiento y trabajadores de los molinos de arroz. |
| What | Se presentan pérdidas de materia prima, disminución del rendimiento, aumento de arroz quebrado y fallas inesperadas en las máquinas. |
| Where | En las diferentes etapas del proceso productivo de los molinos de arroz. |
| When | Durante la recepción de materia prima, procesamiento, mantenimiento y control de calidad, especialmente cuando no se detectan oportunamente las anomalías. |
| Why | Porque los datos de producción, calidad, mantenimiento y materia prima no siempre se encuentran integrados ni relacionados para identificar las causas de los problemas. |
| How | Mediante mermas, menor cantidad de arroz entero, fallas de maquinaria, paradas no planificadas y decisiones basadas en información limitada. |
| How much | Genera costos adicionales, desperdicio de materia prima, disminución de la productividad y posibles pérdidas económicas para el molino. La cuantificación exacta será determinada durante la investigación y validación con usuarios. |

**Objetivo general.**
 - Desarrollar una plataforma web inteligente que integre y analice los datos operativos de los molinos de arroz para detectar posibles causas de pérdidas, anticipar problemas y mejorar la eficiencia del proceso productivo.

**Objetivos específicos**

- Centralizar la información relacionada con la materia prima, producción, calidad y mantenimiento.
- Permitir el monitoreo de indicadores como rendimiento, merma y porcentaje de arroz entero y quebrado.
- Detectar anomalías y posibles fallas en el proceso productivo y en la maquinaria.
- Generar alertas y recomendaciones que apoyen la toma de decisiones operativas.
- Implementar planes de suscripción diferenciados según las necesidades de los molinos pequeños, medianos y grandes.
- Evaluar la utilidad de la plataforma mediante pruebas con usuarios y el análisis de indicadores operativos.
### 1.2.2 Lean UX Process

#### 1.2.2.1 Lean UX Problem Statements



The current state of the rice milling industry has focused mainly on managing production, raw materials, quality control, maintenance, and operational performance through separate records or systems that do not always integrate the information generated throughout the process.

What existing products and services fail to fully address is the need to relate operational data in order to identify the possible causes of losses, detect anomalies, anticipate equipment failures, and improve production performance.

Our product, Molinex, will address this gap through a web-based SaaS platform that centralizes and analyzes data related to raw materials, production, quality, maintenance, and operational indicators. The platform will generate alerts and intelligent recommendations to support decision-making and optimize the milling process.

Our initial focus will be small and medium-sized rice mills that need to improve operational control, reduce losses, and make decisions based on integrated information.

We’ll know we are successful when users regularly consult the platform, monitor operational indicators, respond to alerts and recommendations, and achieve improvements in production performance, waste reduction, and the control of whole and broken rice.



#### 1.2.2.2 Lean UX Assumptions



**Business Assumptions**

- Creemos que los molinos de arroz estarán interesados en utilizar una plataforma digital para mejorar sus operaciones.
- Creemos que el modelo de suscripción permitirá que Molinex sea sostenible y escalable.

**Business Outcome Assumptions**

- Creemos que Molinex generará ingresos recurrentes mediante sus planes de suscripción.
- Creemos que la plataforma permitirá captar y retener clientes del sector arrocero.

**User Assumptions**

- Creemos que los administradores y supervisores necesitan centralizar la información de producción, calidad y mantenimiento.
- Creemos que los usuarios requieren una interfaz sencilla para consultar indicadores y gestionar sus operaciones.

**User Outcome and Benefit Assumptions**

- Creemos que los usuarios podrán identificar posibles causas de pérdidas y fallas con mayor rapidez.
- Creemos que los usuarios mejorarán la toma de decisiones y el control de sus procesos.
- Creemos que la plataforma contribuirá a reducir mermas y mejorar el rendimiento operativo.

**Feature Assumptions**

- Creemos que un dashboard permitirá monitorear indicadores como rendimiento, merma y calidad.
- Creemos que el registro de lotes permitirá realizar un mejor seguimiento de la materia prima.
- Creemos que el módulo de mantenimiento permitirá registrar actividades y detectar posibles anomalías.
- Creemos que el motor de análisis inteligente podrá generar alertas y recomendaciones a partir de los datos operativos.
- Creemos que los planes de suscripción permitirán ofrecer funcionalidades según las necesidades de cada molino.

#### 1.2.2.3 Lean UX Hypothesis Statements





We believe we will achieve improved operational decision-making and process visibility
If administrators and production supervisors
Attain a better understanding of the mill’s performance indicators
With a dashboard that displays production performance, waste, and rice quality data.

**Hypothesis 2: Lot Management**

We believe we will achieve better traceability and control of raw materials
If administrators and production supervisors
Attain faster access to information about received raw materials and production lots
With a lot management module that allows users to register, track, and consult lot information.

**Hypothesis 3: Maintenance Management**

We believe we will achieve reduced unexpected equipment failures and downtime
If maintenance technicians and production supervisors
Attain better visibility of equipment conditions and scheduled maintenance activities
With a maintenance module that allows users to register maintenance activities and identify possible anomalies.

**Hypothesis 4: Intelligent Analysis and Recommendations**

We believe we will achieve reduced operational losses and improved production performance
If administrators, production supervisors, and maintenance technicians
Attain timely information about possible causes of losses and operational problems
With an intelligent analysis engine that relates operational data and generates alerts and recommendations.

**Hypothesis 5: Subscription Plans**

We believe we will achieve customer acquisition and recurring revenue
If owners and administrators of small, medium-sized, and large rice mills
Attain access to functionalities that match their operational needs and available resources
With differentiated Basic, Professional, and Enterprise subscription plans.


#### 1.2.2.4 Lean UX Canvas

| Campo | Síntesis |
|:--|:--|
| Business problem | [ ] |
| Business outcomes | [ ] |
| Users | [ ] |
| User outcomes and benefits | [ ] |
| Solutions | [ ] |
| Hypotheses | [ ] |
| Most important thing to learn | [ ] |
| Least work for learning | [ ] |

## 1.3 Segmentos objetivo

[Descripción de cada segmento: características demográficas e información estadística de sustento.]

<div style="page-break-after: always;"></div>

# Capítulo II Requirements Elicitation & Analysis

## 2.1 Competidores

### 2.1.1 Análisis competitivo

**Competitive Analysis Landscape**

¿Por qué llevar a cabo este análisis? [ ]

| Perfil | Molinex (Vanguard) | Competidor 1 | Competidor 2 | Competidor 3 |
|:--|:--|:--|:--|:--|
| Overview | | | | |
| Ventaja competitiva | | | | |
| ¿Qué valor ofrece a los clientes? | | | | |
| Mercado objetivo | | | | |
| Estrategias de marketing | | | | |
| Productos y servicios | | | | |
| Precios y costos | | | | |
| Canales de distribución (Web y/o Móvil) | | | | |

**Análisis SWOT**

| | Molinex (Vanguard) | Competidor 1 | Competidor 2 | Competidor 3 |
|:--|:--|:--|:--|:--|
| Fortalezas | | | | |
| Debilidades | | | | |
| Oportunidades | | | | |
| Amenazas | | | | |

### 2.1.2 Estrategias y tácticas frente a competidores

| Estrategia | Tácticas de Molinex |
|:--|:--|
| | |

## 2.2 Entrevistas

### 2.2.1 Diseño de entrevistas

| Segmento / Rol | Criterio de selección | Propósito |
|:--|:--|:--|
| | | |

**Guion:**

1. [ ]

### 2.2.2 Registro de entrevistas

[Por cada entrevista: nombre, apellido, edad, distrito, screenshot, enlace en Microsoft Stream, timing/duración y resumen descriptivo. 3 a 5 entrevistas por segmento.]

### 2.2.3 Análisis de entrevistas

[Análisis con sustento estadístico por segmento, a partir de las entrevistas registradas.]

## 2.3 Needfinding

### 2.3.1 User Personas

| Persona | Contexto | Objetivos | Frustraciones | Necesidades |
|:--|:--|:--|:--|:--|
| | | | | |

<p align="center">
  <img src="assets/design/user-personas.png" alt="Fichas de User Persona elaboradas en UXPressia" width="100%">
</p>

### 2.3.2 User Task Matrix

| Tarea | Persona 1 (Frec. / Imp.) | Persona 2 (Frec. / Imp.) | Persona 3 (Frec. / Imp.) |
|:--|:--:|:--:|:--:|
| | | | |

### 2.3.3 User Journey Mapping

[User Journey Map As-Is por cada User Persona, elaborado en UXPressia.]

<p align="center">
  <img src="assets/design/user-journey-map.png" alt="User Journey Map As-Is elaborado en UXPressia" width="100%">
</p>

### 2.3.4 Empathy Mapping

| Dimensión | Persona 1 | Persona 2 | Persona 3 |
|:--|:--|:--|:--|
| Dice | | | |
| Piensa | | | |
| Hace | | | |
| Siente | | | |
| Pains | | | |
| Gains | | | |

<p align="center">
  <img src="assets/design/empathy-map.png" alt="Empathy Map elaborado en UXPressia" width="100%">
</p>

## 2.4 Big Picture Event Storming

[Secuencia de eventos de dominio identificados en la sesión colaborativa, con capturas de la herramienta indicada.]

<p align="center">
  <img src="assets/design/big-picture-event-storming.png" alt="Sesión de Big Picture Event Storming en FigJam" width="100%">
</p>

## 2.5 Ubiquitous Language

| Término (español) | Definición |
|:--|:--|
| | |

<div style="page-break-after: always;"></div>

# Capítulo III Requirements Specification

## 3.1 User Stories

_Un único cuadro para todos los Epics/Stories. Incluir historias del Landing Page (rol visitante) y Technical Stories del API (rol Developer, con Acceptance Criteria de request/response en Gherkin)._

| Epic / Story ID | Título | Descripción | Criterios de Aceptación | Relacionado con (Epic ID) |
|:--|:--|:--|:--|:--|
| | | | | |

## 3.2 Impact Mapping

[Impact Map elaborado en la herramienta indicada (UXPressia).]

<p align="center">
  <img src="assets/design/impact-map.png" alt="Impact Map elaborado en UXPressia" width="100%">
</p>

_URL pública del Impact Map en UXPressia:_ `[URL]`

## 3.3 Product Backlog

| # Orden | User Story Id | Título | Descripción | Story Points (1/2/3/5/8) |
|--:|:--|:--|:--|:--:|
| | | | | |

**Captura y enlace al Product Backlog en la herramienta indicada:** `[URL]`

<div style="page-break-after: always;"></div>

# Capítulo IV Product Design

## 4.1 Style Guidelines

### 4.1.1 General Style Guidelines

[Branding, Typography, Colors, Spacing y tono de comunicación (Divertido/Serio, Formal/Casual, Respetuoso/Irreverente, Entusiasta/Sereno).]

### 4.1.2 Web Style Guidelines

[Estándares visuales y de interacción para las interfaces responsivas.]

## 4.2 Information Architecture

### 4.2.1 Organization Systems

[ ]

### 4.2.2 Labeling Systems

[ ]

### 4.2.3 SEO Tags and Meta Tags

| Página | Title | Meta Description | Keywords | Author |
|:--|:--|:--|:--|:--|
| | | | | |

### 4.2.4 Searching Systems

[ ]

### 4.2.5 Navigation Systems

[ ]

## 4.3 Landing Page UI Design

### 4.3.1 Landing Page Wireframe

[Wireframes Desktop y Mobile elaborados en Figma.]

<p align="center">
  <img src="assets/design/landing-wireframe.png" alt="Wireframe del Landing Page de Molinex" width="100%">
</p>

### 4.3.2 Landing Page Mockup

[Mockups Desktop y Mobile elaborados en Figma.]

<p align="center">
  <img src="assets/design/landing-mockup.png" alt="Mockup del Landing Page de Molinex" width="100%">
</p>

## 4.4 Web Applications UX/UI Design

### 4.4.1 Web Applications Wireframes

[ ]

<p align="center">
  <img src="assets/design/webapp-wireframes.png" alt="Wireframes de la Web Application de Molinex" width="100%">
</p>

### 4.4.2 Web Applications Wireflow Diagrams

[ ]

<p align="center">
  <img src="assets/design/webapp-wireflow.png" alt="Wireflow Diagram de la Web Application de Molinex" width="100%">
</p>

### 4.4.3 Web Applications Mockups

[ ]

<p align="center">
  <img src="assets/design/webapp-mockups.png" alt="Mockups de la Web Application de Molinex" width="100%">
</p>

### 4.4.4 Web Applications User Flow Diagrams

[ ]

<p align="center">
  <img src="assets/design/webapp-user-flow.png" alt="User Flow Diagram de la Web Application de Molinex" width="100%">
</p>

## 4.5 Web Applications Prototyping

[Prototipo interactivo en Figma + video demostrativo.]

<p align="center">
  <img src="assets/design/webapp-prototype.png" alt="Captura del prototipo interactivo en Figma" width="100%">
</p>

_Enlace al video demostrativo (Microsoft Stream):_ `[URL]`

## 4.6 Domain-Driven Software Architecture

### 4.6.1 Design-Level Event Storming

| Bounded Context | Commands (ejemplos) | Events (ejemplos) | Queries (ejemplos) |
|:--|:--|:--|:--|
| | | | |

<p align="center">
  <img src="assets/design/design-level-event-storming.png" alt="Sesión de Design-Level Event Storming en FigJam" width="100%">
</p>

### 4.6.2 Software Architecture Context Diagram

[Context Diagram de C4 Model elaborado en la herramienta indicada (Structurizr).]

<p align="center">
  <img src="assets/design/context-diagram.png" alt="Software Architecture Context Diagram de Molinex" width="100%">
</p>

### 4.6.3 Software Architecture Container Diagrams

[Container Diagram de C4 Model elaborado en la herramienta indicada (Structurizr).]

<p align="center">
  <img src="assets/design/container-diagram.png" alt="Software Architecture Container Diagram de Molinex" width="100%">
</p>

### 4.6.4 Software Architecture Components Diagrams

[Component Diagram de C4 Model por cada Container, elaborado en la herramienta indicada (Structurizr).]

<p align="center">
  <img src="assets/design/component-diagram.png" alt="Software Architecture Component Diagram de Molinex" width="100%">
</p>

## 4.7 Software Object-Oriented Design

### 4.7.1 Class Diagrams

[Class Diagram de UML elaborado en la herramienta indicada (LucidChart), por producto y por bounded context.]

<p align="center">
  <img src="assets/design/class-diagram.png" alt="Class Diagram de Molinex" width="100%">
</p>

## 4.8 Database Design

### 4.8.1 Database Diagrams

[Database Diagram elaborado en la herramienta indicada (ERDPlus/LucidChart/MySQL Workbench), por bounded context.]

<p align="center">
  <img src="assets/design/database-diagram.png" alt="Database Diagram de Molinex" width="100%">
</p>

<div style="page-break-after: always;"></div>

# Capítulo V Product Implementation, Validation & Deployment

## 5.1 Software Configuration Management

### 5.1.1 Software Development Environment Configuration

| Producto | Tecnologías | Herramientas principales |
|:--|:--|:--|
| Landing Page | | |
| Web Application | | |
| RESTful API | | |
| Database | | |

### 5.1.2 Source Code Management

[Repositorios, GitFlow (branches y convenciones), Conventional Commits, Semantic Versioning.]

### 5.1.3 Source Code Style Guide & Coding Conventions

| Área | Convenciones |
|:--|:--|
| | |

### 5.1.4 Software Deployment Configuration

[ ]

## 5.2 Landing Page, Services & Applications Implementation

### 5.2.1 Sprint 1

#### 5.2.1.1 Sprint Planning 1

| Sprint # | Sprint 1 |
|:--|:--|
| **Sprint Planning Background** | |
| Date | [ ] |
| Time | [ ] |
| Location | [ ] |
| Prepared By | [ ] |
| Attendees (to planning meeting) | [ ] |
| Sprint n - 1 Review Summary | No aplica (primer Sprint). |
| Sprint n - 1 Retrospective Summary | No aplica (primer Sprint). |
| **Sprint Goal & User Stories** | |
| Sprint 1 Goal | [Our focus is on... We believe it delivers... This will be confirmed when...] |
| Sprint 1 Velocity | [ ] |
| Sum of Story Points | [ ] |

#### 5.2.1.2 Aspect Leaders and Collaborators

| Team Member (Last Name, First Name) | GitHub Username | Aspecto 1 L/C | Aspecto 2 L/C | Aspecto 3 L/C |
|:--|:--:|:--:|:--:|:--:|
| Casalino Berrocal, Luisa Nhiriel | | | | |
| Gallegos De La Cruz, Giovanni Marcelo | | | | |
| Huerta Cardenas, Brayan Benjamin | | | | |
| Jimenez Saavedra, Antony Alexander | | | | |
| Rivera Rupay, Fabricio Jose | | | | |

#### 5.2.1.3 Sprint Backlog 1

**Captura y enlace al Board:** `[URL]`

| Sprint # | Sprint 1 |
|:--|:--|

| Story Id | Story Title | Task Id | Task Title | Task Description | Estimation (Hours) | Assigned To | Status |
|:--|:--|:--|:--|:--|--:|:--|:--|
| | | | | | | | |

#### 5.2.1.4 Development Evidence for Sprint Review

[Tabla de commits por repositorio: Repository, Branch, Commit Id, Commit Message, Commit Message Body, Commited on.]

#### 5.2.1.5 Execution Evidence for Sprint Review

[Capturas de las vistas implementadas + enlace a video.]

<p align="center">
  <img src="assets/evidence/implemented/landing-desktop.png" alt="Landing Page de Molinex ejecutada en navegador" width="100%">
</p>

<p align="center">
  <img src="assets/evidence/implemented/webapp-login.png" alt="Inicio de sesión de la Web Application de Molinex" width="100%">
</p>

<p align="center">
  <img src="assets/evidence/implemented/webapp-register.png" alt="Registro de cuenta en la Web Application de Molinex" width="100%">
</p>

#### 5.2.1.6 Services Documentation Evidence for Sprint Review

| Contexto | Rutas principales |
|:--|:--|
| | |

<p align="center">
  <img src="assets/evidence/collaboration/swagger-overview.png" alt="Swagger UI del RESTful API de Molinex" width="100%">
</p>

#### 5.2.1.7 Software Deployment Evidence for Sprint Review

[ ]

<p align="center">
  <img src="assets/evidence/collaboration/deployment-config.png" alt="Configuración de despliegue de Molinex" width="100%">
</p>

#### 5.2.1.8 Team Collaboration Insights during Sprint

[ ]

<p align="center">
  <img src="assets/evidence/collaboration/github-branches.png" alt="Ramas GitFlow publicadas en GitHub" width="100%">
</p>

<p align="center">
  <img src="assets/evidence/collaboration/github-contributors.png" alt="GitHub Insights Contributors del repositorio" width="100%">
</p>

<div style="page-break-after: always;"></div>

# Conclusiones

## Conclusiones y recomendaciones

[ ]

<div style="page-break-after: always;"></div>

# Bibliografía

[Referencias en formato APA.]

<div style="page-break-after: always;"></div>

# Anexos

## Anexo A. Videos de Exposiciones

| Entrega | Título | Enlace |
|:--|:--|:--|
| AV1 | | |
