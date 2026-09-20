systemContext molinex "MolinexSystemContext" {
    include visitor administrator maintenanceTechnician productionOperator sensorGateway notificationService molinex
    autoLayout lr
    title "Molinex Platform - System Context Diagram"
    description "People and planned external software systems that interact with the Molinex Platform."
}

container molinex "MolinexContainers" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.landingPage molinex.webApplication molinex.apiApplication molinex.database
    include sensorGateway notificationService
    autoLayout lr
    title "Molinex Platform - Container Diagram"
    description "Applications and data store that make up Molinex, plus its planned external integrations."
}

component molinex.webApplication "MolinexFrontendComponents" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.webApplication.commercialFeature molinex.webApplication.identityFeature
    include molinex.webApplication.productionFeature molinex.webApplication.qualityFeature
    include molinex.webApplication.maintenanceFeature molinex.webApplication.intelligenceFeature
    include molinex.webApplication.reportingFeature molinex.webApplication.frontendShared
    include molinex.apiApplication
    autoLayout lr
    title "Molinex Frontend - Component Overview by Bounded Context"
    description "Frontend feature areas, shared concerns and their relationship with the RESTful API."
}

component molinex.webApplication "MolinexFrontendCommercial" {
    include visitor molinex.webApplication.commercialPresentation molinex.webApplication.commercialApplication
    include molinex.webApplication.commercialDomain molinex.webApplication.commercialInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Commercial Engagement Components"
}
component molinex.webApplication "MolinexFrontendIdentity" {
    include administrator molinex.webApplication.identityPresentation molinex.webApplication.identityApplication
    include molinex.webApplication.identityDomain molinex.webApplication.identityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Identity and Access Management Components"
}
component molinex.webApplication "MolinexFrontendProduction" {
    include productionOperator molinex.webApplication.productionPresentation molinex.webApplication.productionApplication
    include molinex.webApplication.productionDomain molinex.webApplication.productionInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Production Management Components"
}
component molinex.webApplication "MolinexFrontendQuality" {
    include productionOperator molinex.webApplication.qualityPresentation molinex.webApplication.qualityApplication
    include molinex.webApplication.qualityDomain molinex.webApplication.qualityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Quality and Yield Control Components"
}
component molinex.webApplication "MolinexFrontendMaintenance" {
    include maintenanceTechnician molinex.webApplication.maintenancePresentation molinex.webApplication.maintenanceApplication
    include molinex.webApplication.maintenanceDomain molinex.webApplication.maintenanceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Asset and Maintenance Management Components"
}
component molinex.webApplication "MolinexFrontendIntelligence" {
    include maintenanceTechnician molinex.webApplication.intelligencePresentation molinex.webApplication.intelligenceApplication
    include molinex.webApplication.intelligenceDomain molinex.webApplication.intelligenceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Operational Intelligence Components"
}
component molinex.webApplication "MolinexFrontendReporting" {
    include administrator molinex.webApplication.reportingPresentation molinex.webApplication.reportingApplication
    include molinex.webApplication.reportingDomain molinex.webApplication.reportingInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Reporting and Analytics Components"
}
component molinex.webApplication "MolinexFrontendShared" {
    include molinex.webApplication.sharedPresentation molinex.webApplication.sharedApplication
    include molinex.webApplication.sharedDomain molinex.webApplication.sharedInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Shared Module Components"
}

component molinex.apiApplication "MolinexBackendComponents" {
    include molinex.landingPage molinex.webApplication sensorGateway notificationService
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
    include molinex.webApplication notificationService molinex.database
    include molinex.apiApplication.identityInterfaces molinex.apiApplication.identityApplication
    include molinex.apiApplication.identityDomain molinex.apiApplication.identityInfrastructure
    autoLayout tb
    title "Molinex Backend - Identity and Access Management Components"
}
component molinex.apiApplication "MolinexBackendProduction" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.productionInterfaces molinex.apiApplication.productionApplication
    include molinex.apiApplication.productionDomain molinex.apiApplication.productionInfrastructure
    autoLayout tb
    title "Molinex Backend - Production Management Components"
}
component molinex.apiApplication "MolinexBackendQuality" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.qualityInterfaces molinex.apiApplication.qualityApplication
    include molinex.apiApplication.qualityDomain molinex.apiApplication.qualityInfrastructure
    autoLayout tb
    title "Molinex Backend - Quality and Yield Control Components"
}
component molinex.apiApplication "MolinexBackendMaintenance" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.maintenanceInterfaces molinex.apiApplication.maintenanceApplication
    include molinex.apiApplication.maintenanceDomain molinex.apiApplication.maintenanceInfrastructure
    autoLayout tb
    title "Molinex Backend - Asset and Maintenance Management Components"
}
component molinex.apiApplication "MolinexBackendIntelligence" {
    include molinex.webApplication sensorGateway notificationService molinex.database
    include molinex.apiApplication.intelligenceInterfaces molinex.apiApplication.intelligenceApplication
    include molinex.apiApplication.intelligenceDomain molinex.apiApplication.intelligenceInfrastructure
    autoLayout tb
    title "Molinex Backend - Operational Intelligence Components"
}
component molinex.apiApplication "MolinexBackendReporting" {
    include molinex.webApplication molinex.database
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
