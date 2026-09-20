workspace "Molinex Platform" "C4 model for the Molinex rice mill operational management platform." {

    !identifiers hierarchical
    !impliedRelationships false

    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

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
                !include frontend-components.dsl
            }

            apiApplication = container "RESTful API" "Implements the Molinex business capabilities as a modular monolith with isolated domain models." "Java and Spring Boot" {
                tags "Backend Application"
                !include backend-components.dsl
            }

            database = container "Molinex Database" "Stores operational information while preserving logical ownership by backend module." "MySQL" {
                tags "Database"
            }
        }

        !include relationships.dsl
    }

    views {
        !include views.dsl

        styles {
            element "Element" {
                color #183B56
                stroke #2F5B8F
                strokeWidth 2
                fontSize 18
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
            element "Frontend Context" {
                background #DCEEF8
            }
            element "Backend Context" {
                background #B9DDF2
            }
            element "Frontend Shared" {
                background #F3D49A
            }
            element "Shared Kernel" {
                background #F3D49A
            }
            element "Read Side" {
                background #CFE5A8
            }
            element "Frontend Presentation" {
                background #DCEEF8
            }
            element "Frontend Application" {
                background #B9DDF2
            }
            element "Frontend Domain" {
                background #CFE5A8
            }
            element "Frontend Infrastructure" {
                background #E4D5F7
            }
            element "Backend Interfaces" {
                background #8BBDE0
            }
            element "Backend Application Layer" {
                background #B9DDF2
            }
            element "Backend Domain" {
                background #CFE5A8
            }
            element "Backend Infrastructure" {
                background #E4D5F7
            }
            element "External System" {
                background #8C96A0
                color #FFFFFF
            }
            element "Planned" {
                border dashed
            }
            element "Group" {
                color #526D82
                stroke #607D8B
                strokeWidth 2
            }
            relationship "Relationship" {
                color #526D82
                thickness 2
                fontSize 15
            }
        }

        properties {
            "structurizr.metadata" "true"
            "structurizr.description" "true"
        }
    }

    configuration {
        scope softwaresystem
    }
}
