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
frontendShared = component "Frontend Shared Module" "Cross-cutting shell, navigation, session coordination, shared domain values and HTTP concerns." "Angular Shared Area" {
    tags "Frontend Shared"
}

group "Commercial Engagement" {
    group "Presentation" {
        commercialPresentation = component "Plan and Inquiry Views" "Plan catalog, value proposition and commercial inquiry form components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        commercialApplication = component "Commercial Engagement Facade" "Coordinates plan queries, form state and inquiry submission use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        commercialDomain = component "Commercial Engagement Models" "Plan, value proposition and commercial inquiry client-side models and validation rules." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "Commercial API Adapter" "Calls plan and inquiry endpoints and maps API resources to frontend models." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Presentation" {
        identityPresentation = component "Identity and User Views" "Sign-in, user administration, role assignment and profile components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        identityApplication = component "Identity and Access Facade" "Coordinates authentication, authorization, user administration and profile use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        identityDomain = component "Identity and Access Models" "User, profile, role, permission and authenticated-session client-side models." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "Identity API and Session Adapter" "Calls identity endpoints, maps resources and stores authentication tokens securely." "Angular HttpClient, Assemblers and Storage" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Presentation" {
        productionPresentation = component "Production Views" "Raw material reception, production batch and production record components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        productionApplication = component "Production Management Facade" "Coordinates reception, batch, production recording and history use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        productionDomain = component "Production Models" "Reception, batch, production record and production history client-side models." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "Production API Adapter" "Calls production endpoints and maps request and response resources." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Presentation" {
        qualityPresentation = component "Quality and Yield Views" "Quality assessment, waste, yield indicator and comparison components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        qualityApplication = component "Quality and Yield Facade" "Coordinates quality recording, waste registration and indicator query use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        qualityDomain = component "Quality and Yield Models" "Quality assessment, waste, deviation, composition and yield client-side models." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "Quality API Adapter" "Calls quality endpoints and maps request, indicator and comparison resources." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Presentation" {
        maintenancePresentation = component "Machine and Maintenance Views" "Machine inventory, machine status and maintenance history components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        maintenanceApplication = component "Asset and Maintenance Facade" "Coordinates machine registration and preventive and corrective maintenance use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        maintenanceDomain = component "Asset and Maintenance Models" "Machine, maintenance record, technician and anomaly reference client-side models." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "Maintenance API Adapter" "Calls asset and maintenance endpoints and maps API resources." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Presentation" {
        intelligencePresentation = component "Operational Intelligence Views" "Operational variable, anomaly, alert and maintenance recommendation components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        intelligenceApplication = component "Operational Intelligence Facade" "Coordinates operational monitoring, anomaly history and alert attention use cases." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        intelligenceDomain = component "Operational Intelligence Models" "Operational reading, anomaly, alert and recommendation client-side models." "TypeScript Domain Models" {
            tags "Frontend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "Operational Intelligence API Adapter" "Calls monitoring endpoints and maps readings, anomalies and alerts." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Presentation" {
        reportingPresentation = component "Reporting and Analytics Views" "Operational summary, production report, maintenance report and trend components." "Angular Components" {
            tags "Frontend Presentation"
        }
    }
    group "Application" {
        reportingApplication = component "Reporting and Analytics Facade" "Coordinates report filters, report queries and analytics read-model state." "Angular Service and Signals" {
            tags "Frontend Application"
        }
    }
    group "Domain" {
        reportingDomain = component "Reporting Read Models" "Operational summary, report row, metric, date range and trend point models." "TypeScript Read Models" {
            tags "Frontend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "Reporting API Adapter" "Calls reporting endpoints and maps projections to frontend read models." "Angular HttpClient and Assemblers" {
            tags "Frontend Infrastructure"
        }
    }
}

group "Frontend Shared Module" {
    group "Presentation" {
        sharedPresentation = component "Application Shell and Shared UI" "Provides layout, routing, navigation, localization, accessibility and reusable feedback components." "Angular Router and Shared Components" {
            tags "Frontend Presentation" "Frontend Shared"
        }
    }
    group "Application" {
        sharedApplication = component "Session and Context Coordinator" "Coordinates the active user session, current rice mill context and global application state." "Angular Services and Signals" {
            tags "Frontend Application" "Frontend Shared"
        }
    }
    group "Domain" {
        sharedDomain = component "Shared Domain Values" "Provides the Weight and MeasurementUnit value types shared by Production and Quality." "TypeScript Value Objects" {
            tags "Frontend Domain" "Frontend Shared"
        }
    }
    group "Infrastructure" {
        sharedInfrastructure = component "Shared HTTP and Error Handling" "Provides authenticated HTTP configuration, interceptors and consistent technical error handling." "Angular HttpClient and Interceptors" {
            tags "Frontend Infrastructure" "Frontend Shared"
        }
    }
}
