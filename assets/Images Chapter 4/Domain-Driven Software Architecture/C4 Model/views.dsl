systemContext molinex "MolinexSystemContext" {
    include visitor administrator maintenanceTechnician productionOperator sensorGateway notificationService molinex
    autoLayout lr
    title "Molinex Platform - System Context Diagram"
    description "People and external software systems that interact with the Molinex Platform."
}

container molinex "MolinexContainers" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.landingPage molinex.webHost molinex.webApplication molinex.apiApplication molinex.database
    include sensorGateway notificationService
    autoLayout tb
    title "Molinex Platform - Container Diagram"
    description "Applications, data store and external integrations that make up Molinex."
}

component molinex.webApplication "MolinexFrontendComponents" {
    include visitor administrator maintenanceTechnician productionOperator
    include molinex.webApplication.commercialFeature molinex.webApplication.identityFeature
    include molinex.webApplication.productionFeature molinex.webApplication.qualityFeature
    include molinex.webApplication.maintenanceFeature molinex.webApplication.intelligenceFeature
    include molinex.webApplication.reportingFeature molinex.webApplication.frontendSharedKernel
    include molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Component Overview by Bounded Context"
    description "The seven frontend bounded contexts, the Shared Kernel and their relationships with the RESTful API."
}

component molinex.webApplication "MolinexFrontendCommercial" {
    include molinex.webApplication.planCatalog molinex.webApplication.valuePropositionView
    include molinex.webApplication.commercialInquiryForm molinex.webApplication.commercialApplication
    include molinex.webApplication.commercialDomain molinex.webApplication.commercialInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Commercial Engagement Components"
}
component molinex.webApplication "MolinexFrontendIdentity" {
    include molinex.webApplication.authenticationSection molinex.webApplication.signInForm
    include molinex.webApplication.userList molinex.webApplication.userForm
    include molinex.webApplication.roleAssignmentForm molinex.webApplication.profileView
    include molinex.webApplication.identityApplication molinex.webApplication.identityDomain
    include molinex.webApplication.identityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Identity and Access Management Components"
}
component molinex.webApplication "MolinexFrontendProduction" {
    include molinex.webApplication.rawMaterialReceptionList molinex.webApplication.rawMaterialReceptionForm
    include molinex.webApplication.productionBatchList molinex.webApplication.productionBatchForm
    include molinex.webApplication.productionRecordList molinex.webApplication.productionRecordForm
    include molinex.webApplication.productionHistoryView molinex.webApplication.productionApplication
    include molinex.webApplication.productionDomain molinex.webApplication.productionInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Production Management Components"
}
component molinex.webApplication "MolinexFrontendQuality" {
    include molinex.webApplication.qualityAssessmentList molinex.webApplication.qualityAssessmentForm
    include molinex.webApplication.wasteRecordList molinex.webApplication.wasteRecordForm
    include molinex.webApplication.yieldIndicatorDashboard molinex.webApplication.qualityComparisonView
    include molinex.webApplication.qualityDeviationList molinex.webApplication.qualityApplication
    include molinex.webApplication.qualityDomain molinex.webApplication.qualityInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Quality and Yield Control Components"
}
component molinex.webApplication "MolinexFrontendMaintenance" {
    include molinex.webApplication.machineList molinex.webApplication.machineForm
    include molinex.webApplication.machineStatusView molinex.webApplication.maintenanceRecordForm
    include molinex.webApplication.maintenanceHistoryView molinex.webApplication.maintenanceApplication
    include molinex.webApplication.maintenanceDomain molinex.webApplication.maintenanceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Asset and Maintenance Management Components"
}
component molinex.webApplication "MolinexFrontendIntelligence" {
    include molinex.webApplication.operationalVariableDashboard molinex.webApplication.anomalyList
    include molinex.webApplication.alertList molinex.webApplication.maintenanceRecommendationList
    include molinex.webApplication.intelligenceApplication molinex.webApplication.intelligenceDomain
    include molinex.webApplication.intelligenceInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Operational Intelligence Components"
}
component molinex.webApplication "MolinexFrontendReporting" {
    include molinex.webApplication.operationalSummaryView molinex.webApplication.productionReportView
    include molinex.webApplication.maintenanceReportView molinex.webApplication.trendDashboard
    include molinex.webApplication.reportingApplication molinex.webApplication.reportingDomain
    include molinex.webApplication.reportingInfrastructure molinex.apiApplication
    autoLayout tb
    title "Molinex Frontend - Reporting and Analytics Components"
}
component molinex.webApplication "MolinexFrontendSharedKernel" {
    include molinex.webApplication.appLayout molinex.webApplication.navigationMenu
    include molinex.webApplication.sharedViews molinex.webApplication.feedbackMessage
    include molinex.webApplication.sharedKernelDomain molinex.webApplication.sharedInfrastructure
    autoLayout tb
    title "Molinex Frontend - Shared Kernel Components"
    description "Shared presentation, domain values and infrastructure, organized as one Shared Kernel."
}

component molinex.apiApplication "MolinexBackendComponents" {
    include molinex.landingPage molinex.webApplication molinex.database sensorGateway notificationService
    include molinex.apiApplication.commercialModule molinex.apiApplication.identityModule
    include molinex.apiApplication.productionModule molinex.apiApplication.qualityModule
    include molinex.apiApplication.maintenanceModule molinex.apiApplication.intelligenceModule
    include molinex.apiApplication.reportingModule molinex.apiApplication.sharedKernel
    autoLayout tb
    title "Molinex Backend - Component Overview by Bounded Context"
    description "The seven backend bounded contexts, the Shared Kernel, persistence and external integrations of the modular monolith."
}

component molinex.apiApplication "MolinexBackendCommercial" {
    include molinex.landingPage molinex.database
    include molinex.apiApplication.planCatalogInterfaces molinex.apiApplication.commercialInquiryInterfaces
    include molinex.apiApplication.commercialCommandServices molinex.apiApplication.commercialQueryServices
    include molinex.apiApplication.commercialDomain molinex.apiApplication.commercialInfrastructure
    autoLayout tb
    title "Molinex Backend - Commercial Engagement Components"
}
component molinex.apiApplication "MolinexBackendIdentity" {
    include molinex.webApplication notificationService molinex.database
    include molinex.apiApplication.authenticationInterfaces molinex.apiApplication.userAdministrationInterfaces
    include molinex.apiApplication.profileInterfaces molinex.apiApplication.identityCommandServices
    include molinex.apiApplication.identityQueryServices molinex.apiApplication.identityDomain
    include molinex.apiApplication.identityInfrastructure
    autoLayout tb
    title "Molinex Backend - Identity and Access Management Components"
}
component molinex.apiApplication "MolinexBackendProduction" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.rawMaterialReceptionInterfaces molinex.apiApplication.productionBatchInterfaces
    include molinex.apiApplication.productionRecordInterfaces molinex.apiApplication.productionCommandServices
    include molinex.apiApplication.productionQueryServices molinex.apiApplication.productionDomain
    include molinex.apiApplication.productionInfrastructure
    autoLayout tb
    title "Molinex Backend - Production Management Components"
}
component molinex.apiApplication "MolinexBackendQuality" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.qualityAssessmentInterfaces molinex.apiApplication.wasteRecordInterfaces
    include molinex.apiApplication.yieldAnalysisInterfaces molinex.apiApplication.qualityCommandServices
    include molinex.apiApplication.qualityQueryServices molinex.apiApplication.qualityDomain
    include molinex.apiApplication.qualityInfrastructure
    autoLayout tb
    title "Molinex Backend - Quality and Yield Control Components"
}
component molinex.apiApplication "MolinexBackendMaintenance" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.machineInterfaces molinex.apiApplication.maintenanceRecordInterfaces
    include molinex.apiApplication.maintenanceCommandServices molinex.apiApplication.maintenanceQueryServices
    include molinex.apiApplication.maintenanceDomain molinex.apiApplication.maintenanceInfrastructure
    autoLayout tb
    title "Molinex Backend - Asset and Maintenance Management Components"
}
component molinex.apiApplication "MolinexBackendIntelligence" {
    include molinex.webApplication sensorGateway notificationService molinex.database
    include molinex.apiApplication.telemetryIngestionInterfaces molinex.apiApplication.monitoringInterfaces
    include molinex.apiApplication.intelligenceCommandServices molinex.apiApplication.intelligenceQueryServices
    include molinex.apiApplication.intelligenceDomain molinex.apiApplication.intelligenceInfrastructure
    autoLayout tb
    title "Molinex Backend - Operational Intelligence Components"
}
component molinex.apiApplication "MolinexBackendReporting" {
    include molinex.webApplication molinex.database
    include molinex.apiApplication.reportingInterfaces molinex.apiApplication.reportingQueryServices
    include molinex.apiApplication.reportingProjectionHandlers molinex.apiApplication.reportingDomain
    include molinex.apiApplication.reportingInfrastructure
    autoLayout tb
    title "Molinex Backend - Reporting and Analytics Components"
}
component molinex.apiApplication "MolinexBackendSharedKernel" {
    include molinex.apiApplication.sharedKernelDomain
    autoLayout tb
    title "Molinex Backend - Shared Kernel Components"
    description "Value objects shared by Production Management and Quality and Yield Control."
}
