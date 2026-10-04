systemContext molinex "MolinexSystemContext" {
    include visitor administrator maintenanceTechnician productionOperator sensorGateway notificationService molinex
    autoLayout lr
    title "Molinex Platform - System Context Diagram"
    description "People and planned external software systems that interact with the Molinex Platform."
}

container molinex "MolinexContainers" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.landingPage molinex.webApplication molinex.spa molinex.apiApplication molinex.database
    include sensorGateway notificationService
    autoLayout lr
    title "Molinex Platform - Container Diagram"
    description "Applications and data store that make up Molinex, plus its planned external integrations."
}

component molinex.spa "MolinexFrontendComponents" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.spa.commercialFeature molinex.spa.identityFeature
    include molinex.spa.productionFeature molinex.spa.qualityFeature
    include molinex.spa.maintenanceFeature molinex.spa.intelligenceFeature
    include molinex.spa.reportingFeature molinex.spa.frontendShared
    include molinex.apiApplication
    autoLayout lr
    title "Molinex Frontend - Component Overview by Bounded Context"
    description "Frontend feature areas, shared concerns and their relationship with the RESTful API."
}

component molinex.spa "MolinexFrontendCommercial" {
    include visitor molinex.spa.commercialPresentation molinex.spa.commercialApplication
    include molinex.spa.commercialDomain molinex.spa.commercialInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Commercial Engagement Components"
}
component molinex.spa "MolinexFrontendIdentity" {
    include administrator molinex.spa.identityPresentation molinex.spa.identityApplication
    include molinex.spa.identityDomain molinex.spa.identityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Identity and Access Management Components"
}
component molinex.spa "MolinexFrontendProduction" {
    include productionOperator molinex.spa.productionPresentation molinex.spa.productionApplication
    include molinex.spa.productionDomain molinex.spa.productionInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Production Management Components"
}
component molinex.spa "MolinexFrontendQuality" {
    include productionOperator molinex.spa.qualityPresentation molinex.spa.qualityApplication
    include molinex.spa.qualityDomain molinex.spa.qualityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Quality and Yield Control Components"
}
component molinex.spa "MolinexFrontendMaintenance" {
    include maintenanceTechnician molinex.spa.maintenancePresentation molinex.spa.maintenanceApplication
    include molinex.spa.maintenanceDomain molinex.spa.maintenanceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Asset and Maintenance Management Components"
}
component molinex.spa "MolinexFrontendIntelligence" {
    include maintenanceTechnician molinex.spa.intelligencePresentation molinex.spa.intelligenceApplication
    include molinex.spa.intelligenceDomain molinex.spa.intelligenceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Operational Intelligence Components"
}
component molinex.spa "MolinexFrontendReporting" {
    include administrator molinex.spa.reportingPresentation molinex.spa.reportingApplication
    include molinex.spa.reportingDomain molinex.spa.reportingInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Reporting and Analytics Components"
}
component molinex.spa "MolinexFrontendShared" {
    include molinex.spa.sharedPresentation molinex.spa.sharedApplication
    include molinex.spa.sharedDomain molinex.spa.sharedInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Shared Module Components"
}

component molinex.apiApplication "MolinexBackendComponents" {
    include molinex.landingPage molinex.spa sensorGateway notificationService
    include molinex.apiApplication.commercialModule molinex.apiApplication.identityModule
    include molinex.apiApplication.productionModule molinex.apiApplication.qualityModule
    include molinex.apiApplication.maintenanceModule molinex.apiApplication.intelligenceModule
    include molinex.apiApplication.reportingModule molinex.apiApplication.sharedKernel
    autoLayout tb
    title "Molinex Backend - Component Overview by Bounded Context"
    description "Bounded Context modules, Shared Kernel, persistence and planned external integrations of the modular monolith."
}

component molinex.apiApplication "MolinexBackendCommercial" {
    include molinex.landingPage molinex.database
    include molinex.apiApplication.commercialInterfaces molinex.apiApplication.commercialApplication
    include molinex.apiApplication.commercialDomain molinex.apiApplication.commercialInfrastructure
    autoLayout tb
    title "Molinex Backend - Commercial Engagement Components"
}
component molinex.apiApplication "MolinexBackendIdentity" {
    include molinex.spa notificationService molinex.database
    include molinex.apiApplication.identityInterfaces molinex.apiApplication.identityApplication
    include molinex.apiApplication.identityDomain molinex.apiApplication.identityInfrastructure
    autoLayout tb
    title "Molinex Backend - Identity and Access Management Components"
}
component molinex.apiApplication "MolinexBackendProduction" {
    include molinex.spa molinex.database
    include molinex.apiApplication.productionInterfaces molinex.apiApplication.productionApplication
    include molinex.apiApplication.productionDomain molinex.apiApplication.productionInfrastructure
    autoLayout tb
    title "Molinex Backend - Production Management Components"
}
component molinex.apiApplication "MolinexBackendQuality" {
    include molinex.spa molinex.database
    include molinex.apiApplication.qualityInterfaces molinex.apiApplication.qualityApplication
    include molinex.apiApplication.qualityDomain molinex.apiApplication.qualityInfrastructure
    autoLayout tb
    title "Molinex Backend - Quality and Yield Control Components"
}
component molinex.apiApplication "MolinexBackendMaintenance" {
    include molinex.spa molinex.database
    include molinex.apiApplication.maintenanceInterfaces molinex.apiApplication.maintenanceApplication
    include molinex.apiApplication.maintenanceDomain molinex.apiApplication.maintenanceInfrastructure
    autoLayout tb
    title "Molinex Backend - Asset and Maintenance Management Components"
}
component molinex.apiApplication "MolinexBackendIntelligence" {
    include molinex.spa sensorGateway notificationService molinex.database
    include molinex.apiApplication.intelligenceInterfaces molinex.apiApplication.intelligenceApplication
    include molinex.apiApplication.intelligenceDomain molinex.apiApplication.intelligenceInfrastructure
    autoLayout tb
    title "Molinex Backend - Operational Intelligence Components"
}
component molinex.apiApplication "MolinexBackendReporting" {
    include molinex.spa molinex.database
    include molinex.apiApplication.reportingInterfaces molinex.apiApplication.reportingApplication
    include molinex.apiApplication.reportingDomain molinex.apiApplication.reportingInfrastructure
    autoLayout tb
    title "Molinex Backend - Reporting and Analytics Components"
}
component molinex.apiApplication "MolinexBackendSharedKernel" {
    include molinex.apiApplication.productionDomain molinex.apiApplication.qualityDomain
    include molinex.apiApplication.sharedKernelDomain
    autoLayout lr
    title "Molinex Backend - Production-Quality Shared Kernel Components"
    description "The Shared Kernel intentionally contains only domain value objects; it has no Interfaces, Application or Infrastructure layers."
}
