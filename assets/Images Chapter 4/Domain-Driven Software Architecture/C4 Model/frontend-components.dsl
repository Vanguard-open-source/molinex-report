commercialFeature = component "Commercial Engagement" "Frontend module for plan discovery, the value proposition and commercial inquiries." "Angular Feature Area" {
    tags "Frontend Context"
}
identityFeature = component "Identity and Access Management" "Frontend module for sign-in, user administration, roles, permissions and profiles." "Angular Feature Area" {
    tags "Frontend Context"
}
productionFeature = component "Production Management" "Frontend module for raw material receptions, batches and production records." "Angular Feature Area" {
    tags "Frontend Context"
}
qualityFeature = component "Quality and Yield Control" "Frontend module for quality results, yield indicators, rice composition and waste." "Angular Feature Area" {
    tags "Frontend Context"
}
maintenanceFeature = component "Asset and Maintenance Management" "Frontend module for machine inventory and preventive and corrective maintenance." "Angular Feature Area" {
    tags "Frontend Context"
}
intelligenceFeature = component "Operational Intelligence" "Frontend module for operational variables, anomalies, alerts and recommendations." "Angular Feature Area" {
    tags "Frontend Context"
}
reportingFeature = component "Reporting and Analytics" "Frontend module for summaries, reports and operational trends." "Angular Feature Area" {
    tags "Frontend Context" "Read Side"
}
frontendSharedKernel = component "Shared Kernel" "Shared presentation, domain values and infrastructure reused across the frontend." "Angular and TypeScript Shared Area" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Presentation" {
        planCatalog = component "PlanCatalog" "plan-catalog.ts/html/css: presents the available plans and their features." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        valuePropositionView = component "ValuePropositionView" "value-proposition.ts/html/css: presents the benefits and capabilities offered by Molinex." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        commercialInquiryForm = component "CommercialInquiryForm" "commercial-inquiry-form.ts/html/css: collects and validates a visitor's contact request." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        commercialApplication = component "CommercialStore" "CommercialStore holds plans, the value proposition, inquiry state, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        commercialDomain = component "commercial-engagement/domain/model" "Plan, ValueProposition and CommercialInquiry: represent the public offer and a visitor's commercial request." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "commercial-engagement/infrastructure" "CommercialApi, PlanAssembler, ValuePropositionAssembler and CommercialInquiryAssembler communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Presentation" {
        authenticationSection = component "AuthenticationSection" "authentication-section.ts/html/css: presents the active user and authentication actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        signInForm = component "SignInForm" "sign-in-form.ts/html/css: collects and validates registered-user credentials." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        userList = component "UserList" "user-list.ts/html/css: lists users and exposes administration actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        userForm = component "UserForm" "user-form.ts/html/css: registers or updates a user and profile information." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        roleAssignmentForm = component "RoleAssignmentForm" "role-assignment-form.ts/html/css: assigns roles and permissions to a user." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        profileView = component "ProfileView" "profile-view.ts/html/css: presents and updates the current user's profile." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        identityApplication = component "IdentityAccessStore" "IdentityAccessStore holds the authenticated user, token, users, roles, permissions, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        identityDomain = component "identity-access-management/domain/model" "User, Profile, Role, Permission and AuthenticatedSession: represent identity, authorization and the active session." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "identity-access-management/infrastructure" "IamApi, authentication assemblers, TokenStorage, authenticationGuard and iamInterceptor communicate with the API and protect authenticated navigation." "HTTP, Assemblers, Storage, Guard and Interceptor" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Presentation" {
        rawMaterialReceptionList = component "RawMaterialReceptionList" "raw-material-reception-list.ts/html/css: lists registered raw material receptions and their available actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        rawMaterialReceptionForm = component "RawMaterialReceptionForm" "raw-material-reception-form.ts/html/css: registers a raw material reception and validates its required information." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionBatchList = component "ProductionBatchList" "production-batch-list.ts/html/css: lists production batches and their associated receptions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionBatchForm = component "ProductionBatchForm" "production-batch-form.ts/html/css: registers a production batch for an available reception." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionRecordList = component "ProductionRecordList" "production-record-list.ts/html/css: lists production records and their available update actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionRecordForm = component "ProductionRecordForm" "production-record-form.ts/html/css: registers or updates production information for a selected batch." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionHistoryView = component "ProductionHistory" "production-history.ts/html/css: presents production history and its available filters." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        productionApplication = component "ProductionManagementStore" "ProductionManagementStore holds receptions, batches, production records, loaded flags and errors, and coordinates production operations." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        productionDomain = component "production-management/domain/model" "RawMaterialReception, ProductionBatch and ProductionRecord: represent reception, batching and the production process." "Entities" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "production-management/infrastructure" "ProductionApi, RawMaterialReceptionAssembler, ProductionBatchAssembler and ProductionRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Presentation" {
        qualityAssessmentList = component "QualityAssessmentList" "quality-assessment-list.ts/html/css: lists quality assessments and their results." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        qualityAssessmentForm = component "QualityAssessmentForm" "quality-assessment-form.ts/html/css: records measurements and quality results for production." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        wasteRecordList = component "WasteRecordList" "waste-record-list.ts/html/css: lists registered waste and its production references." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        wasteRecordForm = component "WasteRecordForm" "waste-record-form.ts/html/css: records waste and validates its measured quantity." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        yieldIndicatorDashboard = component "YieldIndicatorDashboard" "yield-indicator-dashboard.ts/html/css: presents yield, composition and quality indicators." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        qualityComparisonView = component "QualityComparisonView" "quality-comparison.ts/html/css: compares quality results across periods or production records." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        qualityDeviationList = component "QualityDeviationList" "quality-deviation-list.ts/html/css: presents identified quality deviations." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        qualityApplication = component "QualityControlStore" "QualityControlStore holds assessments, waste records, indicators, comparisons, deviations, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        qualityDomain = component "quality-yield-control/domain/model" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition: represent quality and yield results." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "quality-yield-control/infrastructure" "QualityApi and the assessment, waste, indicator, comparison and deviation assemblers communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Presentation" {
        machineList = component "MachineList" "machine-list.ts/html/css: lists machines, their status and available actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        machineForm = component "MachineForm" "machine-form.ts/html/css: registers or updates a machine." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        machineStatusView = component "MachineStatusView" "machine-status.ts/html/css: presents a machine's current operational and maintenance status." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        maintenanceRecordForm = component "MaintenanceRecordForm" "maintenance-record-form.ts/html/css: records preventive or corrective maintenance." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        maintenanceHistoryView = component "MaintenanceHistoryView" "maintenance-history.ts/html/css: lists maintenance history with machine and date filters." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        maintenanceApplication = component "AssetMaintenanceStore" "AssetMaintenanceStore holds machines, maintenance records, status, history, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        maintenanceDomain = component "asset-maintenance-management/domain/model" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference: represent assets and maintenance work." "Entities and Value Objects" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "asset-maintenance-management/infrastructure" "MaintenanceApi, MachineAssembler and MaintenanceRecordAssembler communicate with the API and map resources to and from entities." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Presentation" {
        operationalVariableDashboard = component "OperationalVariableDashboard" "operational-variable-dashboard.ts/html/css: presents current and historical operational readings." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        anomalyList = component "AnomalyList" "anomaly-list.ts/html/css: lists detected operational anomalies and their details." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        alertList = component "AlertList" "alert-list.ts/html/css: lists operational alerts and exposes attention actions." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        maintenanceRecommendationList = component "MaintenanceRecommendationList" "maintenance-recommendation-list.ts/html/css: presents recommendations derived from anomalies and alerts." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        intelligenceApplication = component "OperationalIntelligenceStore" "OperationalIntelligenceStore holds readings, anomalies, alerts, recommendations, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        intelligenceDomain = component "operational-intelligence/domain/model" "OperationalReading, OperationalAnomaly, Alert and MaintenanceRecommendation: represent monitoring results and required attention." "Entities and Read Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "operational-intelligence/infrastructure" "IntelligenceApi and the reading, anomaly, alert and recommendation assemblers communicate with the API and map resources to and from models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Presentation" {
        operationalSummaryView = component "OperationalSummaryView" "operational-summary.ts/html/css: presents consolidated production, quality and maintenance indicators." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        productionReportView = component "ProductionReportView" "production-report.ts/html/css: presents filterable production report rows." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        maintenanceReportView = component "MaintenanceReportView" "maintenance-report.ts/html/css: presents filterable maintenance report rows." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
        trendDashboard = component "TrendDashboard" "trend-dashboard.ts/html/css: visualizes operational metrics and trends over time." "Angular Component and Angular Material" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        reportingApplication = component "ReportingStore" "ReportingStore holds summaries, report rows, filters, trends, loaded flags and errors." "Angular Signals Store" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        reportingDomain = component "reporting-analytics/domain/model" "OperationalSummary, ReportRow, MetricValue, DateRange and TrendPoint: represent read-only reporting projections." "Read Models" {
            tags "Frontend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "reporting-analytics/infrastructure" "ReportingApi and the summary, report and trend assemblers query the API and map resources to read models." "HTTP and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Shared Kernel" {
    group "Presentation" {
        appLayout = component "Layout" "app-layout.ts/html/css: hosts the application shell, toolbar, navigation and routed content." "Angular Component and Angular Material" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        navigationMenu = component "SideNavigation" "navigation-menu.ts/html/css: presents role-aware access to the application's feature areas." "Angular Component and Angular Material" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        sharedViews = component "shared/presentation/views" "Home, access-denied and page-not-found views that do not belong to a business bounded context." "Angular Views" {
            tags "Frontend Presentation" "Shared Kernel"
        }
        feedbackMessage = component "FeedbackMessage" "feedback-message.ts/html/css: presents reusable success, warning and error feedback." "Angular Component and Angular Material" {
            tags "Frontend Presentation" "Shared Kernel"
        }
    }
    group "Domain" {
        sharedKernelDomain = component "shared/domain/model" "Weight and MeasurementUnit: shared value objects used by Production Management and Quality and Yield Control." "Value Objects" {
            tags "Frontend Domain" "Shared Kernel"
        }
    }
    group "Infrastructure" {
        sharedInfrastructure = component "shared/infrastructure" "BaseApi, authenticated HTTP configuration, request interceptors and ApiErrorHandler provide common API communication and error handling." "HTTP, Base Classes and Interceptors" {
            tags "Frontend Infrastructure" "Shared Kernel"
        }
    }
}
