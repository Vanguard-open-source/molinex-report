workspace "Molinex Platform" "C4 model for the Molinex rice mill operational management platform." {

    !identifiers hierarchical
    !impliedRelationships false

    model {
        visitor = person "Visitor" "Explores the value proposition, capabilities and plans offered by Molinex."
        administrator = person "Administrator" "Manages users and supervises production, quality, maintenance and operational indicators."
        maintenanceTechnician = person "Maintenance Technician" "Registers machines and maintenance work, and reviews anomalies and alerts."
        productionOperator = person "Production Operator" "Records raw material, batches, production, quality and waste information."
        sensorGateway = softwareSystem "Rice Mill Sensor Gateway" "Collects rice mill telemetry and sends planned operational readings to Molinex." {
            tags "External System" "Planned"
        }
        notificationService = softwareSystem "Notification Delivery Service" "Delivers planned account and critical operational alert notifications." {
            tags "External System" "Planned"
        }


        molinex = softwareSystem "Molinex Platform" "Centralizes rice mill production, quality, maintenance and operational intelligence information." {
            landingPage = container "Landing Page" "Presents the Molinex value proposition, capabilities, benefits, plans and contact options." "HTML, CSS and JavaScript" {
                tags "Landing Page"
            }
            webApplication = container "Web Application" "Provides role-based operational management and analytics through a responsive browser experience." "Angular and TypeScript" {
                tags "Web Application"
                applicationShell = component "Application Shell and Routing" "Provides navigation, layout, route protection and feature composition." "Angular Router and Standalone Components" {
                    tags "Frontend Core"
                }
                identityFeature = component "Identity and Access Feature" "Supports sign-in, user administration, roles, permissions and profile management." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                productionFeature = component "Production Management Feature" "Supports raw material receptions, batches and production records." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                qualityFeature = component "Quality and Yield Feature" "Supports quality results, yield indicators, rice composition and waste records." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                maintenanceFeature = component "Asset and Maintenance Feature" "Supports machine inventory and preventive and corrective maintenance records." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                intelligenceFeature = component "Operational Intelligence Feature" "Presents operational variables, anomalies, alerts and maintenance recommendations." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                reportingFeature = component "Reporting and Analytics Feature" "Presents operational summaries, reports and historical trends." "Angular and TypeScript" {
                    tags "Frontend Feature"
                }
                apiClient = component "REST API Client" "Centralizes authenticated HTTP communication and error handling for backend operations." "Angular HttpClient" {
                    tags "Frontend Core"
                }
            }
            apiApplication = container "RESTful API" "Implements the Molinex business capabilities as a modular monolith with isolated domain models." "Java and Spring Boot" {
                tags "Backend Application"
                apiInterface = component "REST API Interface" "Validates HTTP requests, enforces access policies and delegates commands and queries to the appropriate module." "Spring Web MVC and Spring Security" {
                    tags "Backend Interface"
                }
                commercialModule = component "Commercial Engagement Module" "Provides plan information and manages commercial inquiries from interested visitors." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                identityModule = component "Identity and Access Management Module" "Manages users, authentication, roles, permissions and profile information." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                productionModule = component "Production Management Module" "Manages raw material receptions, production batches and production records." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                qualityModule = component "Quality and Yield Control Module" "Manages quality assessments, waste records, yield indicators and quality deviations." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                maintenanceModule = component "Asset and Maintenance Management Module" "Manages machines and preventive and corrective maintenance records." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                intelligenceModule = component "Operational Intelligence Module" "Records operational readings, detects anomalies and generates operational alerts." "Java and Spring Boot" {
                    tags "Bounded Context"
                }
                reportingModule = component "Reporting and Analytics Module" "Builds read-side projections for summaries, reports and operational trends." "Java and Spring Boot" {
                    tags "Bounded Context" "Read Side"
                }
                sharedKernel = component "Production-Quality Shared Kernel" "Contains only the Weight and MeasurementUnit value objects shared by Production and Quality." "Java" {
                    tags "Shared Kernel"
                }
            }
            database = container "Molinex Database" "Stores operational information while preserving logical ownership by backend module." "MySQL" {
                tags "Database"
        sensorGateway -> molinex "Sends planned operational readings to Molinex." "HTTPS or MQTT"
        molinex -> notificationService "Sends planned account and operational alert notifications to." "HTTPS API or SMTP"
            }
        }

        visitor -> molinex "Explores product information and requests commercial contact through Molinex."
        administrator -> molinex "Uses Molinex to administer users and supervise rice mill operations."
        maintenanceTechnician -> molinex "Uses Molinex to manage machines, maintenance, anomalies and alerts."
        sensorGateway -> molinex.apiApplication "Sends planned operational readings to" "HTTPS or MQTT"
        molinex.apiApplication -> notificationService "Sends planned account and operational alert notifications through" "HTTPS API or SMTP"
        productionOperator -> molinex "Uses Molinex to record production, quality and waste information."

        visitor -> molinex.landingPage "Explores product information using" "HTTPS"
        administrator -> molinex.webApplication "Administers users and supervises operations using" "HTTPS"
        maintenanceTechnician -> molinex.webApplication "Manages machines, maintenance and alerts using" "HTTPS"
        productionOperator -> molinex.webApplication "Records production and quality information using" "HTTPS"
        molinex.landingPage -> molinex.apiApplication "Submits commercial inquiries to" "JSON/HTTPS REST"
        molinex.webApplication -> molinex.apiApplication "Manages and queries operational information through" "JSON/HTTPS REST"
        molinex.apiApplication -> molinex.database "Reads from and writes to" "JDBC/SQL"

        administrator -> molinex.webApplication.applicationShell "Uses role-based features through"
        maintenanceTechnician -> molinex.webApplication.applicationShell "Uses role-based features through"
        productionOperator -> molinex.webApplication.applicationShell "Uses role-based features through"
        molinex.webApplication.applicationShell -> molinex.webApplication.identityFeature "Routes identity workflows to"
        molinex.webApplication.applicationShell -> molinex.webApplication.productionFeature "Routes production workflows to"
        molinex.webApplication.applicationShell -> molinex.webApplication.qualityFeature "Routes quality workflows to"
        molinex.webApplication.applicationShell -> molinex.webApplication.maintenanceFeature "Routes maintenance workflows to"
        molinex.webApplication.applicationShell -> molinex.webApplication.intelligenceFeature "Routes intelligence workflows to"
        molinex.webApplication.applicationShell -> molinex.webApplication.reportingFeature "Routes reporting workflows to"
        molinex.webApplication.identityFeature -> molinex.webApplication.apiClient "Requests identity operations through"
        molinex.webApplication.productionFeature -> molinex.webApplication.apiClient "Requests production operations through"
        molinex.webApplication.qualityFeature -> molinex.webApplication.apiClient "Requests quality operations through"
        molinex.webApplication.maintenanceFeature -> molinex.webApplication.apiClient "Requests maintenance operations through"
        molinex.webApplication.intelligenceFeature -> molinex.webApplication.apiClient "Requests intelligence operations through"
        molinex.webApplication.reportingFeature -> molinex.webApplication.apiClient "Requests reports and projections through"
        molinex.webApplication.apiClient -> molinex.apiApplication "Invokes authenticated endpoints on" "JSON/HTTPS REST"

        molinex.landingPage -> molinex.apiApplication.apiInterface "Submits commercial inquiries to" "JSON/HTTPS REST"
        molinex.webApplication -> molinex.apiApplication.apiInterface "Invokes role-protected operations on" "JSON/HTTPS REST"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.commercialModule "Delegates plan and inquiry requests to"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.identityModule "Delegates authentication and user requests to"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.productionModule "Delegates production commands and queries to"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.qualityModule "Delegates quality commands and queries to"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.maintenanceModule "Delegates maintenance commands and queries to"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.intelligenceModule "Delegates intelligence commands and queries to"
        sensorGateway -> molinex.apiApplication.intelligenceModule "Provides raw operational measurements to" "HTTPS or MQTT"
        molinex.apiApplication.identityModule -> notificationService "Requests account notification delivery from" "HTTPS API or SMTP"
        molinex.apiApplication.intelligenceModule -> notificationService "Requests operational alert delivery from" "HTTPS API"
        molinex.apiApplication.apiInterface -> molinex.apiApplication.reportingModule "Delegates reporting queries to"
        molinex.apiApplication.productionModule -> molinex.apiApplication.qualityModule "Publishes production events to" "In-process domain events"
        molinex.apiApplication.qualityModule -> molinex.apiApplication.intelligenceModule "Publishes quality deviation events to" "In-process domain events"
        molinex.apiApplication.maintenanceModule -> molinex.apiApplication.intelligenceModule "Publishes machine and maintenance events to" "In-process domain events"
        molinex.apiApplication.intelligenceModule -> molinex.apiApplication.maintenanceModule "Publishes anomaly information for corrective work to" "In-process domain events"
        molinex.apiApplication.productionModule -> molinex.apiApplication.reportingModule "Publishes production events to" "In-process domain events"
        molinex.apiApplication.qualityModule -> molinex.apiApplication.reportingModule "Publishes quality and yield events to" "In-process domain events"
        molinex.apiApplication.maintenanceModule -> molinex.apiApplication.reportingModule "Publishes maintenance events to" "In-process domain events"
        molinex.apiApplication.intelligenceModule -> molinex.apiApplication.reportingModule "Publishes anomaly and alert events to" "In-process domain events"
        molinex.apiApplication.productionModule -> molinex.apiApplication.sharedKernel "Uses Weight and MeasurementUnit from"
        molinex.apiApplication.qualityModule -> molinex.apiApplication.sharedKernel "Uses Weight and MeasurementUnit from"
    }

    views {
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
            include administrator maintenanceTechnician productionOperator
            include molinex.webApplication.applicationShell molinex.webApplication.identityFeature
            include molinex.webApplication.productionFeature molinex.webApplication.qualityFeature
            include molinex.webApplication.maintenanceFeature molinex.webApplication.intelligenceFeature
            include molinex.webApplication.reportingFeature molinex.webApplication.apiClient
            include molinex.apiApplication
            autoLayout lr
            title "Molinex Web Application - Component Diagram"
            description "Angular components grouped by operational feature area."
        }
        component molinex.apiApplication "MolinexBackendComponents" {
            include molinex.landingPage molinex.webApplication sensorGateway notificationService
            include molinex.apiApplication.apiInterface molinex.apiApplication.commercialModule
            include molinex.apiApplication.identityModule molinex.apiApplication.productionModule
            include molinex.apiApplication.qualityModule molinex.apiApplication.maintenanceModule
            include molinex.apiApplication.intelligenceModule molinex.apiApplication.reportingModule
            include molinex.apiApplication.sharedKernel
            autoLayout tb
            title "Molinex RESTful API - Component Diagram"
            description "Bounded Context modules and planned external integrations of the Spring Boot modular monolith."
        }

        styles {
            element "Element" {
                color #183B56
                stroke #2F5B8F
                strokeWidth 2
                fontSize 20
            }
            element "Person" {
                shape person
                background #2F5B8F
                color #FFFFFF
            }
            element "Software System" {
                background #3278B7
                color #FFFFFF
            }
            element "Container" {
                background #72ACD6
                color #102A43
            }
            element "Landing Page" {
                shape webBrowser
                background #DCEEF8
            }
            element "Web Application" {
                shape webBrowser
                background #B9DDF2
            }
            element "Backend Application" {
                background #5B9CCB
                color #FFFFFF
            }
            element "Database" {
                shape cylinder
                background #A8C96F
                color #17324D
            }
            element "Component" {
                background #EAF4FB
                color #17324D
            }
            element "Frontend Core" {
                background #9BCBE8
            }
            element "External System" {
                background #8C96A0
                color #FFFFFF
            }
            element "Planned" {
                border dashed
            }
            element "Frontend Feature" {
                background #DCEEF8
            }
            element "Backend Interface" {
                background #8BBDE0
            }
            element "Bounded Context" {
                background #B9DDF2
            }
            element "Read Side" {
                background #CFE5A8
            }
            element "Shared Kernel" {
                background #F3D49A
            }
            element "Boundary" {
                color #607D8B
                stroke #607D8B
                strokeWidth 2
            }
            relationship "Relationship" {
                color #526D82
                thickness 2
                fontSize 16
            }
        }
    }

    configuration {
        scope softwaresystem
    }
}
