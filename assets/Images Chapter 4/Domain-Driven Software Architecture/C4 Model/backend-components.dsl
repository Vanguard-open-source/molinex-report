commercialModule = component "Commercial Engagement" "Supporting module for plan information and commercial inquiries." "Spring Boot Module" {
    tags "Backend Context"
}
identityModule = component "Identity and Access Management" "Generic module for authentication, users, roles, permissions and profiles." "Spring Boot Module" {
    tags "Backend Context"
}
productionModule = component "Production Management" "Core module for raw material receptions, production batches and production records." "Spring Boot Module" {
    tags "Backend Context"
}
qualityModule = component "Quality and Yield Control" "Core module for quality assessments, waste, indicators and deviations." "Spring Boot Module" {
    tags "Backend Context"
}
maintenanceModule = component "Asset and Maintenance Management" "Core module for machines and preventive and corrective maintenance." "Spring Boot Module" {
    tags "Backend Context"
}
intelligenceModule = component "Operational Intelligence" "Core module for readings, anomaly detection and operational alerts." "Spring Boot Module" {
    tags "Backend Context"
}
reportingModule = component "Reporting and Analytics" "Read-side module for summaries, reports and operational trends." "Spring Boot Module" {
    tags "Backend Context" "Read Side"
}
sharedKernel = component "Shared Kernel" "Contains Weight and MeasurementUnit, shared by Production Management and Quality and Yield Control." "Java Value Objects" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Interfaces" {
        planCatalogInterfaces = component "Plan Catalog REST Interface" "PlanController, plan resources and assemblers expose the available plan catalog and value proposition." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        commercialInquiryInterfaces = component "Commercial Inquiry REST Interface" "CommercialInquiryController, request resources and assemblers receive visitor contact requests." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        commercialCommandServices = component "Commercial Command Services" "SubmitCommercialInquiryService validates and coordinates commercial inquiry submission." "Java Command Services" {
            tags "Backend Application Layer"
        }
        commercialQueryServices = component "Commercial Query Services" "GetPlanCatalogService and GetValuePropositionService answer public offer queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        commercialDomain = component "Commercial Model" "CommercialInquiry, Plan and ValueProposition: represent the public offer and the commercial contact workflow." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "commercial-engagement/infrastructure" "Spring Data JPA configuration, inquiry and plan repositories, relational mappings and domain-event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Interfaces" {
        authenticationInterfaces = component "Authentication REST Interface" "AuthenticationController, credential resources and assemblers expose sign-in and account-registration operations." "Spring Web MVC and Spring Security" {
            tags "Backend Interfaces"
        }
        userAdministrationInterfaces = component "User Administration REST Interface" "UsersController, role and permission resources and assemblers expose administrative operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        profileInterfaces = component "Profile REST Interface" "ProfileController, profile resources and assemblers expose the current user's profile operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        identityCommandServices = component "Identity Command Services" "Coordinates account registration, authentication, role assignment and profile updates." "Java Command Services" {
            tags "Backend Application Layer"
        }
        identityQueryServices = component "Identity Query Services" "Answers user, role, permission and profile queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        identityDomain = component "Identity Model" "User, Profile, Role, Permission and AuthenticatedPrincipal: represent accounts, authorization and published identity." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "identity-access-management/infrastructure" "Spring Data JPA configuration, repositories, password hashing, token issuing and notification delivery integration." "Spring Data JPA and Spring Security" {
            tags "Backend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Interfaces" {
        rawMaterialReceptionInterfaces = component "Raw Material Reception REST Interface" "RawMaterialReceptionsController, resources and assemblers expose reception operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        productionBatchInterfaces = component "Production Batch REST Interface" "ProductionBatchesController, resources and assemblers expose batch operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        productionRecordInterfaces = component "Production Record REST Interface" "ProductionRecordsController, resources and assemblers expose production-record operations and history." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        productionCommandServices = component "Production Command Services" "Coordinates commands for raw material receptions, production batches and production records." "Java Command Services" {
            tags "Backend Application Layer"
        }
        productionQueryServices = component "Production Query Services" "Answers process, available reception, available batch and production-history queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        productionDomain = component "Production Model" "RawMaterialReception, ProductionBatch and ProductionRecord: model reception, batching and the production process." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "production-management/infrastructure" "Spring Data JPA configuration, reception, batch and record repositories, relational mappings and domain-event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Interfaces" {
        qualityAssessmentInterfaces = component "Quality Assessment REST Interface" "QualityAssessmentsController, resources and assemblers expose quality-result operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        wasteRecordInterfaces = component "Waste Record REST Interface" "WasteRecordsController, resources and assemblers expose waste-recording operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        yieldAnalysisInterfaces = component "Yield Analysis REST Interface" "YieldIndicatorsController and comparison resources expose indicators, comparisons and deviations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        qualityCommandServices = component "Quality Command Services" "Coordinates quality assessment, waste recording and deviation-identification commands." "Java Command Services" {
            tags "Backend Application Layer"
        }
        qualityQueryServices = component "Quality Query Services" "Answers quality-result, yield-indicator and comparison queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        qualityDomain = component "Quality Model" "QualityAssessment, WasteRecord, QualityDeviation, YieldIndicator and RiceComposition: model quality and yield results." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "quality-yield-control/infrastructure" "Spring Data JPA configuration, quality and waste repositories, relational mappings and domain-event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Interfaces" {
        machineInterfaces = component "Machine REST Interface" "MachinesController, machine resources and assemblers expose inventory and status operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
        maintenanceRecordInterfaces = component "Maintenance Record REST Interface" "MaintenanceRecordsController, resources and assemblers expose preventive, corrective and history operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        maintenanceCommandServices = component "Maintenance Command Services" "Coordinates machine registration and preventive or corrective maintenance recording." "Java Command Services" {
            tags "Backend Application Layer"
        }
        maintenanceQueryServices = component "Maintenance Query Services" "Answers machine status, inventory and maintenance-history queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        maintenanceDomain = component "Maintenance Model" "Machine, MaintenanceRecord, TechnicianReference and AnomalyReference: model assets and maintenance work." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "asset-maintenance-management/infrastructure" "Spring Data JPA configuration, machine and maintenance repositories, relational mappings and domain-event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Interfaces" {
        telemetryIngestionInterfaces = component "Telemetry Ingestion Interface" "OperationalReadingsController and ingestion resources receive sensor measurements." "Spring Web MVC Integration Endpoint" {
            tags "Backend Interfaces"
        }
        monitoringInterfaces = component "Monitoring REST Interface" "AnomaliesController, AlertsController, resources and assemblers expose monitoring and alert-attention operations." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        intelligenceCommandServices = component "Operational Intelligence Command Services" "Coordinates reading registration, anomaly detection, alert generation and alert-attention commands." "Java Command Services" {
            tags "Backend Application Layer"
        }
        intelligenceQueryServices = component "Operational Intelligence Query Services" "Answers reading-history, anomaly, alert and recommendation queries." "Java Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        intelligenceDomain = component "Operational Intelligence Model" "OperationalReading, OperationalAnomaly, Alert, DetectionCriterion and AnomalyDetectionService: model monitoring and alerting." "Java Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "operational-intelligence/infrastructure" "Spring Data JPA configuration, telemetry integration, repositories, notification delivery, relational mappings and event publication." "Spring Data JPA and External Integrations" {
            tags "Backend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Interfaces" {
        reportingInterfaces = component "Reporting REST Interface" "ReportsController, summary, report and trend resources and assemblers expose read-only queries." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        reportingQueryServices = component "Reporting Query Services" "Answers operational summary, production report, maintenance report and trend queries." "Java Query Services" {
            tags "Backend Application Layer" "Read Side"
        }
        reportingProjectionHandlers = component "Reporting Projection Handlers" "Consumes published operational events and updates reporting projections." "Java Event Handlers" {
            tags "Backend Application Layer" "Read Side"
        }
    }
    group "Domain" {
        reportingDomain = component "Reporting Model" "OperationalSummary, ReportRow, ReportDimension, MetricValue, DateRange and TrendPoint: define read-only projections." "Java Read Models" {
            tags "Backend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "reporting-analytics/infrastructure" "Spring Data JPA configuration, projection repositories and denormalized relational mappings." "Spring Data JPA" {
            tags "Backend Infrastructure" "Read Side"
        }
    }
}

group "Shared Kernel" {
    group "Domain" {
        sharedKernelDomain = component "Shared Kernel Model" "Weight and MeasurementUnit: value objects shared by Production Management and Quality and Yield Control." "Java Value Objects" {
            tags "Backend Domain" "Shared Kernel"
        }
    }
}
