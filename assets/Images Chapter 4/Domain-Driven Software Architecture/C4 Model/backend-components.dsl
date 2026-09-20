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
sharedKernel = component "Production-Quality Shared Kernel" "Contains only Weight and MeasurementUnit, shared by Production and Quality." "Java Value Objects" {
    tags "Shared Kernel"
}

group "Commercial Engagement" {
    group "Interfaces" {
        commercialInterfaces = component "Commercial REST Interface" "Plan catalog and commercial inquiry controllers, resources and assemblers." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        commercialApplication = component "Commercial Application Services" "Handles SubmitCommercialInquiry and the GetPlanCatalog and GetValueProposition queries." "Java Application Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        commercialDomain = component "Commercial Domain Model" "CommercialInquiry aggregate, contact value objects, domain event and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        commercialInfrastructure = component "Commercial Persistence Adapter" "Implements inquiry and plan repository contracts with JPA and relational mappings." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Identity and Access Management" {
    group "Interfaces" {
        identityInterfaces = component "Identity REST Interface" "Authentication, user, role and profile controllers, resources and assemblers." "Spring Web MVC and Spring Security" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        identityApplication = component "Identity Application Services" "Handles registration, authentication, role assignment, profile updates and identity queries." "Java Application Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        identityDomain = component "Identity Domain Model" "User aggregate, identity value objects, authorization policies, domain events and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        identityInfrastructure = component "Identity Security and Persistence Adapters" "Implements repositories, password hashing, token issuing and notification delivery ports." "Spring Data JPA and Spring Security" {
            tags "Backend Infrastructure"
        }
    }
}

group "Production Management" {
    group "Interfaces" {
        productionInterfaces = component "Production REST Interface" "Reception, batch and production record controllers, resources and assemblers." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        productionApplication = component "Production Application Services" "Handles production commands, process queries, history queries and domain event publication." "Java Command and Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        productionDomain = component "Production Domain Model" "RawMaterialReception, ProductionBatch and ProductionRecord aggregates, value objects, events and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        productionInfrastructure = component "Production Persistence Adapter" "Implements production repositories and in-process domain event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Quality and Yield Control" {
    group "Interfaces" {
        qualityInterfaces = component "Quality REST Interface" "Quality, waste, yield and comparison controllers, resources and assemblers." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        qualityApplication = component "Quality Application Services" "Handles quality commands, indicator queries, comparisons and deviation identification." "Java Command and Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        qualityDomain = component "Quality and Yield Domain Model" "QualityAssessment, WasteRecord and QualityDeviation aggregates, value objects, events and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        qualityInfrastructure = component "Quality Persistence Adapter" "Implements quality repositories and in-process domain event publication." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Asset and Maintenance Management" {
    group "Interfaces" {
        maintenanceInterfaces = component "Maintenance REST Interface" "Machine and maintenance controllers, resources and assemblers." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        maintenanceApplication = component "Asset and Maintenance Application Services" "Handles machine registration, maintenance recording, status and history queries." "Java Command and Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        maintenanceDomain = component "Asset and Maintenance Domain Model" "Machine and MaintenanceRecord aggregates, references, events and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        maintenanceInfrastructure = component "Maintenance Persistence Adapter" "Implements machine and maintenance repositories and publishes in-process events." "Spring Data JPA" {
            tags "Backend Infrastructure"
        }
    }
}

group "Operational Intelligence" {
    group "Interfaces" {
        intelligenceInterfaces = component "Operational Intelligence Interface" "Telemetry ingestion and monitoring controllers, resources and assemblers." "Spring Web MVC and Integration Endpoints" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        intelligenceApplication = component "Operational Intelligence Application Services" "Coordinates reading registration, anomaly detection, alert generation and monitoring queries." "Java Command and Query Services" {
            tags "Backend Application Layer"
        }
    }
    group "Domain" {
        intelligenceDomain = component "Operational Intelligence Domain Model" "OperationalReading, OperationalAnomaly and Alert aggregates, criteria, events and repository contracts." "Java Domain Model" {
            tags "Backend Domain"
        }
    }
    group "Infrastructure" {
        intelligenceInfrastructure = component "Telemetry, Notification and Persistence Adapters" "Adapts sensor messages, implements repositories and delivers operational notifications." "Spring Data JPA and Integration Adapters" {
            tags "Backend Infrastructure"
        }
    }
}

group "Reporting and Analytics" {
    group "Interfaces" {
        reportingInterfaces = component "Reporting REST Interface" "Operational summary, report and trend query controllers and response assemblers." "Spring Web MVC" {
            tags "Backend Interfaces"
        }
    }
    group "Application" {
        reportingApplication = component "Reporting Query Services" "Handles report queries and updates projections from operational domain events." "Java Query Services and Event Handlers" {
            tags "Backend Application Layer" "Read Side"
        }
    }
    group "Domain" {
        reportingDomain = component "Reporting Read Model" "ReportRow, MetricValue, DateRange, TrendPoint and projection repository contracts; no aggregate roots." "Java Read Models" {
            tags "Backend Domain" "Read Side"
        }
    }
    group "Infrastructure" {
        reportingInfrastructure = component "Reporting Projection Adapter" "Implements read repositories and stores denormalized reporting projections." "Spring Data JPA" {
            tags "Backend Infrastructure" "Read Side"
        }
    }
}

group "Production-Quality Shared Kernel" {
    group "Domain" {
        sharedKernelDomain = component "Shared Kernel Domain Model" "Defines only the Weight and MeasurementUnit value objects shared by Production and Quality." "Java Value Objects" {
            tags "Backend Domain" "Shared Kernel"
        }
    }
}
