-- Molinex relational schema
-- Target: MySQL 8.0+
-- The schema supports a multi-tenant SaaS: every operational record is scoped
-- directly or transitively to a rice mill. Stable cross-context foreign keys
-- enforce integrity in the shared database of the modular monolith; application
-- modules must still collaborate through services and published domain events.

CREATE DATABASE IF NOT EXISTS molinex
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE molinex;

-- ---------------------------------------------------------------------------
-- Commercial Engagement bounded context
-- Public catalog and pre-customer inquiries. This area is intentionally not
-- tenant-owned because a visitor may contact Molinex before becoming a client.
-- ---------------------------------------------------------------------------

CREATE TABLE plans (
    code            VARCHAR(30)       NOT NULL,
    name            VARCHAR(80)       NOT NULL,
    price_label     VARCHAR(100)      NOT NULL,
    display_order   SMALLINT UNSIGNED NOT NULL,
    is_active       BOOLEAN           NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_plans PRIMARY KEY (code),
    CONSTRAINT uq_plans_name UNIQUE (name),
    CONSTRAINT uq_plans_display_order UNIQUE (display_order),
    CONSTRAINT chk_plans_code CHECK (CHAR_LENGTH(TRIM(code)) > 0),
    CONSTRAINT chk_plans_price_label CHECK (CHAR_LENGTH(TRIM(price_label)) > 0),
    CONSTRAINT chk_plans_display_order CHECK (display_order > 0)
) ENGINE = InnoDB
  COMMENT = 'Commercial Engagement: public catalog of Molinex plans';

CREATE TABLE features (
    code            VARCHAR(60)  NOT NULL,
    name            VARCHAR(120) NOT NULL,
    description     VARCHAR(500) NOT NULL,

    CONSTRAINT pk_features PRIMARY KEY (code),
    CONSTRAINT uq_features_name UNIQUE (name),
    CONSTRAINT chk_features_code CHECK (CHAR_LENGTH(TRIM(code)) > 0),
    CONSTRAINT chk_features_description CHECK (CHAR_LENGTH(TRIM(description)) > 0)
) ENGINE = InnoDB
  COMMENT = 'Commercial Engagement: normalized catalog of plan features';

CREATE TABLE plan_features (
    plan_code       VARCHAR(30)       NOT NULL,
    feature_code    VARCHAR(60)       NOT NULL,
    display_order   SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_plan_features PRIMARY KEY (plan_code, feature_code),
    CONSTRAINT uq_plan_features_order UNIQUE (plan_code, display_order),
    CONSTRAINT fk_plan_features_plan
        FOREIGN KEY (plan_code) REFERENCES plans (code)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT fk_plan_features_feature
        FOREIGN KEY (feature_code) REFERENCES features (code)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_plan_features_display_order CHECK (display_order > 0)
) ENGINE = InnoDB
  COMMENT = 'Commercial Engagement: many-to-many association between plans and features';

CREATE TABLE plan_conditions (
    plan_code       VARCHAR(30)       NOT NULL,
    condition_order SMALLINT UNSIGNED NOT NULL,
    condition_text  VARCHAR(500)      NOT NULL,

    CONSTRAINT pk_plan_conditions PRIMARY KEY (plan_code, condition_order),
    CONSTRAINT fk_plan_conditions_plan
        FOREIGN KEY (plan_code) REFERENCES plans (code)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT chk_plan_conditions_order CHECK (condition_order > 0),
    CONSTRAINT chk_plan_conditions_text CHECK (CHAR_LENGTH(TRIM(condition_text)) > 0)
) ENGINE = InnoDB
  COMMENT = 'Commercial Engagement: ordered conditions displayed for each plan';

CREATE TABLE commercial_inquiries (
    id                      CHAR(36)      NOT NULL,
    interested_plan_code    VARCHAR(30)   NULL,
    full_name               VARCHAR(150)  NOT NULL,
    email                   VARCHAR(254)  NOT NULL,
    phone_number            VARCHAR(30)   NULL,
    company_name            VARCHAR(150)  NOT NULL,
    message                 VARCHAR(2000) NOT NULL,
    submitted_at            DATETIME(6)   NOT NULL,

    CONSTRAINT pk_commercial_inquiries PRIMARY KEY (id),
    CONSTRAINT fk_commercial_inquiries_plan
        FOREIGN KEY (interested_plan_code) REFERENCES plans (code)
        ON UPDATE RESTRICT ON DELETE SET NULL,
    CONSTRAINT chk_commercial_inquiries_name CHECK (CHAR_LENGTH(TRIM(full_name)) > 0),
    CONSTRAINT chk_commercial_inquiries_company CHECK (CHAR_LENGTH(TRIM(company_name)) > 0),
    CONSTRAINT chk_commercial_inquiries_message CHECK (CHAR_LENGTH(TRIM(message)) > 0),
    INDEX idx_commercial_inquiries_submitted_at (submitted_at)
) ENGINE = InnoDB
  COMMENT = 'Commercial Engagement: pre-customer commercial contact requests';

-- ---------------------------------------------------------------------------
-- Tenant and Identity Access Management
-- A user may belong to several mills and may have a different role in each one.
-- ---------------------------------------------------------------------------

CREATE TABLE rice_mills (
    id                  CHAR(36)     NOT NULL,
    business_name       VARCHAR(150) NOT NULL,
    trade_name          VARCHAR(150) NULL,
    tax_identifier      VARCHAR(20)  NOT NULL,
    status              VARCHAR(20)  NOT NULL,
    created_at          DATETIME(6)  NOT NULL,

    CONSTRAINT pk_rice_mills PRIMARY KEY (id),
    CONSTRAINT uq_rice_mills_tax_identifier UNIQUE (tax_identifier),
    CONSTRAINT chk_rice_mills_business_name CHECK (CHAR_LENGTH(TRIM(business_name)) > 0),
    CONSTRAINT chk_rice_mills_tax_identifier CHECK (CHAR_LENGTH(TRIM(tax_identifier)) > 0),
    CONSTRAINT chk_rice_mills_status CHECK (status IN ('ACTIVE', 'INACTIVE'))
) ENGINE = InnoDB
  COMMENT = 'Tenant Management: rice mills that own operational data';

CREATE TABLE roles (
    code            VARCHAR(40)  NOT NULL,
    name            VARCHAR(80)  NOT NULL,

    CONSTRAINT pk_roles PRIMARY KEY (code),
    CONSTRAINT uq_roles_name UNIQUE (name)
) ENGINE = InnoDB
  COMMENT = 'IAM: roles available within a mill membership';

CREATE TABLE permissions (
    code            VARCHAR(60)  NOT NULL,
    name            VARCHAR(100) NOT NULL,

    CONSTRAINT pk_permissions PRIMARY KEY (code),
    CONSTRAINT uq_permissions_name UNIQUE (name)
) ENGINE = InnoDB
  COMMENT = 'IAM: permissions granted through roles';

CREATE TABLE role_permissions (
    role_code        VARCHAR(40) NOT NULL,
    permission_code  VARCHAR(60) NOT NULL,

    CONSTRAINT pk_role_permissions PRIMARY KEY (role_code, permission_code),
    CONSTRAINT fk_role_permissions_role
        FOREIGN KEY (role_code) REFERENCES roles (code)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT fk_role_permissions_permission
        FOREIGN KEY (permission_code) REFERENCES permissions (code)
        ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE = InnoDB
  COMMENT = 'IAM: many-to-many association between roles and permissions';

CREATE TABLE users (
    id              CHAR(36)     NOT NULL,
    email           VARCHAR(254) NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    full_name       VARCHAR(150) NOT NULL,
    job_title       VARCHAR(100) NOT NULL,
    phone_number    VARCHAR(30)  NOT NULL,
    status          VARCHAR(20)  NOT NULL,

    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT uq_users_email UNIQUE (email),
    CONSTRAINT chk_users_status CHECK (status IN ('ACTIVE', 'INACTIVE', 'LOCKED')),
    CONSTRAINT chk_users_full_name CHECK (CHAR_LENGTH(TRIM(full_name)) > 0)
) ENGINE = InnoDB
  COMMENT = 'IAM: global user identity and credentials';

CREATE TABLE mill_memberships (
    id              CHAR(36)    NOT NULL,
    mill_id         CHAR(36)    NOT NULL,
    user_id         CHAR(36)    NOT NULL,
    role_code       VARCHAR(40) NOT NULL,
    status          VARCHAR(20) NOT NULL,
    joined_at       DATETIME(6) NOT NULL,

    CONSTRAINT pk_mill_memberships PRIMARY KEY (id),
    CONSTRAINT uq_mill_memberships_user UNIQUE (mill_id, user_id),
    CONSTRAINT fk_mill_memberships_mill
        FOREIGN KEY (mill_id) REFERENCES rice_mills (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_mill_memberships_user
        FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_mill_memberships_role
        FOREIGN KEY (role_code) REFERENCES roles (code)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_mill_memberships_status CHECK (status IN ('ACTIVE', 'INACTIVE')),
    INDEX idx_mill_memberships_user (user_id),
    INDEX idx_mill_memberships_role (role_code)
) ENGINE = InnoDB
  COMMENT = 'Tenant and IAM: user role scoped to one rice mill';

-- ---------------------------------------------------------------------------
-- Production Management bounded context
-- ---------------------------------------------------------------------------

CREATE TABLE raw_material_receptions (
    id                  CHAR(36)      NOT NULL,
    mill_id             CHAR(36)      NOT NULL,
    received_at         DATETIME(6)   NOT NULL,
    supplier_name       VARCHAR(150)  NOT NULL,
    origin_description  VARCHAR(255)  NOT NULL,
    quantity_value      DECIMAL(18,4) NOT NULL,
    quantity_unit       VARCHAR(20)   NOT NULL,

    CONSTRAINT pk_raw_material_receptions PRIMARY KEY (id),
    CONSTRAINT fk_raw_material_receptions_mill
        FOREIGN KEY (mill_id) REFERENCES rice_mills (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_receptions_quantity CHECK (quantity_value > 0),
    CONSTRAINT chk_receptions_unit CHECK (quantity_unit IN ('KILOGRAM', 'METRIC_TON')),
    CONSTRAINT chk_receptions_supplier CHECK (CHAR_LENGTH(TRIM(supplier_name)) > 0),
    INDEX idx_receptions_mill_received (mill_id, received_at)
) ENGINE = InnoDB
  COMMENT = 'Production: raw-material reception owned by a rice mill';

CREATE TABLE production_batches (
    id              CHAR(36)    NOT NULL,
    code            VARCHAR(50) NOT NULL,
    reception_id    CHAR(36)    NOT NULL,
    registered_at   DATETIME(6) NOT NULL,

    CONSTRAINT pk_production_batches PRIMARY KEY (id),
    CONSTRAINT uq_production_batches_code UNIQUE (code),
    CONSTRAINT fk_production_batches_reception
        FOREIGN KEY (reception_id) REFERENCES raw_material_receptions (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE = InnoDB
  COMMENT = 'Production: batches traced to a raw-material reception';

CREATE TABLE production_records (
    id                      CHAR(36)      NOT NULL,
    batch_id                CHAR(36)      NOT NULL,
    process_name            VARCHAR(120)  NOT NULL,
    processed_weight_value  DECIMAL(18,4) NOT NULL,
    processed_weight_unit   VARCHAR(20)   NOT NULL,
    started_at              DATETIME(6)   NOT NULL,
    finished_at             DATETIME(6)   NULL,
    status                  VARCHAR(20)   NOT NULL,
    recorded_at             DATETIME(6)   NOT NULL,

    CONSTRAINT pk_production_records PRIMARY KEY (id),
    CONSTRAINT fk_production_records_batch
        FOREIGN KEY (batch_id) REFERENCES production_batches (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_production_records_weight CHECK (processed_weight_value > 0),
    CONSTRAINT chk_production_records_unit
        CHECK (processed_weight_unit IN ('KILOGRAM', 'METRIC_TON')),
    CONSTRAINT chk_production_records_status
        CHECK (status IN ('REGISTERED', 'IN_PROGRESS', 'COMPLETED')),
    CONSTRAINT chk_production_records_dates
        CHECK (finished_at IS NULL OR finished_at >= started_at),
    CONSTRAINT chk_production_records_completion
        CHECK (status <> 'COMPLETED' OR finished_at IS NOT NULL),
    INDEX idx_production_records_batch_started (batch_id, started_at)
) ENGINE = InnoDB
  COMMENT = 'Production: processing activity recorded for a batch';

-- ---------------------------------------------------------------------------
-- Quality and Yield Control bounded context
-- ---------------------------------------------------------------------------

CREATE TABLE quality_assessments (
    id                      CHAR(36)    NOT NULL,
    production_record_id    CHAR(36)    NOT NULL,
    assessed_at             DATETIME(6) NOT NULL,

    CONSTRAINT pk_quality_assessments PRIMARY KEY (id),
    CONSTRAINT fk_quality_assessments_production_record
        FOREIGN KEY (production_record_id) REFERENCES production_records (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    INDEX idx_quality_assessments_record_time (production_record_id, assessed_at)
) ENGINE = InnoDB
  COMMENT = 'Quality: assessment of a production record';

CREATE TABLE quality_measurements (
    assessment_id              CHAR(36)     NOT NULL,
    indicator                  VARCHAR(40)  NOT NULL,
    value_percentage           DECIMAL(5,2) NOT NULL,
    expected_min_percentage    DECIMAL(5,2) NOT NULL,
    expected_max_percentage    DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_quality_measurements PRIMARY KEY (assessment_id, indicator),
    CONSTRAINT fk_quality_measurements_assessment
        FOREIGN KEY (assessment_id) REFERENCES quality_assessments (id)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT chk_quality_measurements_indicator
        CHECK (indicator IN ('WHOLE_GRAIN_PERCENTAGE', 'BROKEN_GRAIN_PERCENTAGE', 'YIELD_PERCENTAGE')),
    CONSTRAINT chk_quality_measurements_value CHECK (value_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_measurements_minimum CHECK (expected_min_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_measurements_maximum CHECK (expected_max_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_measurements_range CHECK (expected_min_percentage <= expected_max_percentage)
) ENGINE = InnoDB
  COMMENT = 'Quality: normalized measurements belonging to an assessment';

CREATE TABLE waste_records (
    id                      CHAR(36)      NOT NULL,
    production_record_id    CHAR(36)      NOT NULL,
    quantity_value          DECIMAL(18,4) NOT NULL,
    quantity_unit           VARCHAR(20)   NOT NULL,
    base_weight_value       DECIMAL(18,4) NULL,
    base_weight_unit        VARCHAR(20)   NULL,
    percentage              DECIMAL(5,2)  NULL,
    recorded_at             DATETIME(6)   NOT NULL,

    CONSTRAINT pk_waste_records PRIMARY KEY (id),
    CONSTRAINT fk_waste_records_production_record
        FOREIGN KEY (production_record_id) REFERENCES production_records (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_waste_records_quantity CHECK (quantity_value >= 0),
    CONSTRAINT chk_waste_records_quantity_unit CHECK (quantity_unit IN ('KILOGRAM', 'METRIC_TON')),
    CONSTRAINT chk_waste_records_base_pair
        CHECK ((base_weight_value IS NULL AND base_weight_unit IS NULL)
            OR (base_weight_value IS NOT NULL AND base_weight_unit IS NOT NULL)),
    CONSTRAINT chk_waste_records_base_value CHECK (base_weight_value IS NULL OR base_weight_value > 0),
    CONSTRAINT chk_waste_records_base_unit
        CHECK (base_weight_unit IS NULL OR base_weight_unit IN ('KILOGRAM', 'METRIC_TON')),
    CONSTRAINT chk_waste_records_percentage CHECK (percentage IS NULL OR percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_waste_records_percentage_source CHECK (percentage IS NULL OR base_weight_value IS NOT NULL),
    INDEX idx_waste_records_record_time (production_record_id, recorded_at)
) ENGINE = InnoDB
  COMMENT = 'Quality: waste quantity and optional percentage for a production record';

CREATE TABLE quality_deviations (
    id                          CHAR(36)     NOT NULL,
    assessment_id               CHAR(36)     NULL,
    waste_record_id             CHAR(36)     NULL,
    indicator                   VARCHAR(40)  NOT NULL,
    observed_percentage         DECIMAL(5,2) NOT NULL,
    expected_min_percentage     DECIMAL(5,2) NOT NULL,
    expected_max_percentage     DECIMAL(5,2) NOT NULL,
    detected_at                 DATETIME(6)  NOT NULL,

    CONSTRAINT pk_quality_deviations PRIMARY KEY (id),
    CONSTRAINT fk_quality_deviations_assessment
        FOREIGN KEY (assessment_id) REFERENCES quality_assessments (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_quality_deviations_waste_record
        FOREIGN KEY (waste_record_id) REFERENCES waste_records (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_quality_deviations_single_source
        CHECK ((assessment_id IS NOT NULL AND waste_record_id IS NULL)
            OR (assessment_id IS NULL AND waste_record_id IS NOT NULL)),
    CONSTRAINT chk_quality_deviations_indicator
        CHECK (indicator IN ('WHOLE_GRAIN_PERCENTAGE', 'BROKEN_GRAIN_PERCENTAGE', 'YIELD_PERCENTAGE')),
    CONSTRAINT chk_quality_deviations_observed CHECK (observed_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_deviations_minimum CHECK (expected_min_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_deviations_maximum CHECK (expected_max_percentage BETWEEN 0 AND 100),
    CONSTRAINT chk_quality_deviations_range CHECK (expected_min_percentage <= expected_max_percentage)
) ENGINE = InnoDB
  COMMENT = 'Quality: detected deviation with exactly one internal source';

-- ---------------------------------------------------------------------------
-- Asset and Maintenance Management bounded context: assets
-- ---------------------------------------------------------------------------

CREATE TABLE machines (
    id                  CHAR(36)     NOT NULL,
    mill_id             CHAR(36)     NOT NULL,
    code                VARCHAR(50)  NOT NULL,
    name                VARCHAR(120) NOT NULL,
    model               VARCHAR(120) NOT NULL,
    status              VARCHAR(30)  NOT NULL,
    status_changed_at   DATETIME(6)  NOT NULL,

    CONSTRAINT pk_machines PRIMARY KEY (id),
    CONSTRAINT uq_machines_mill_code UNIQUE (mill_id, code),
    CONSTRAINT fk_machines_mill
        FOREIGN KEY (mill_id) REFERENCES rice_mills (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_machines_status
        CHECK (status IN ('OPERATIONAL', 'REQUIRES_ATTENTION', 'UNDER_MAINTENANCE', 'OUT_OF_SERVICE')),
    CONSTRAINT chk_machines_name CHECK (CHAR_LENGTH(TRIM(name)) > 0)
) ENGINE = InnoDB
  COMMENT = 'Asset: machinery owned by a rice mill';

-- ---------------------------------------------------------------------------
-- Operational Intelligence bounded context
-- ---------------------------------------------------------------------------

CREATE TABLE operational_readings (
    id              CHAR(36)      NOT NULL,
    machine_id      CHAR(36)      NOT NULL,
    variable_name   VARCHAR(100)  NOT NULL,
    measured_value  DECIMAL(18,4) NOT NULL,
    unit_symbol     VARCHAR(30)   NOT NULL,
    recorded_at     DATETIME(6)   NOT NULL,

    CONSTRAINT pk_operational_readings PRIMARY KEY (id),
    CONSTRAINT fk_operational_readings_machine
        FOREIGN KEY (machine_id) REFERENCES machines (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_operational_readings_variable CHECK (CHAR_LENGTH(TRIM(variable_name)) > 0),
    CONSTRAINT chk_operational_readings_unit CHECK (CHAR_LENGTH(TRIM(unit_symbol)) > 0),
    INDEX idx_operational_readings_machine_time (machine_id, recorded_at)
) ENGINE = InnoDB
  COMMENT = 'Operational Intelligence: sensor and manual measurements';

CREATE TABLE operational_anomalies (
    id                  CHAR(36)      NOT NULL,
    reading_id          CHAR(36)      NOT NULL,
    criterion_minimum   DECIMAL(18,4) NOT NULL,
    criterion_maximum   DECIMAL(18,4) NOT NULL,
    detected_at         DATETIME(6)   NOT NULL,
    status              VARCHAR(20)   NOT NULL,

    CONSTRAINT pk_operational_anomalies PRIMARY KEY (id),
    CONSTRAINT fk_operational_anomalies_reading
        FOREIGN KEY (reading_id) REFERENCES operational_readings (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_operational_anomalies_criterion CHECK (criterion_minimum <= criterion_maximum),
    CONSTRAINT chk_operational_anomalies_status
        CHECK (status IN ('DETECTED', 'ACKNOWLEDGED', 'RESOLVED')),
    INDEX idx_operational_anomalies_reading_time (reading_id, detected_at)
) ENGINE = InnoDB
  COMMENT = 'Operational Intelligence: anomaly detected from one reading';

CREATE TABLE alerts (
    id              CHAR(36)    NOT NULL,
    anomaly_id      CHAR(36)    NOT NULL,
    priority        VARCHAR(20) NOT NULL,
    status          VARCHAR(20) NOT NULL,
    generated_at    DATETIME(6) NOT NULL,

    CONSTRAINT pk_alerts PRIMARY KEY (id),
    CONSTRAINT fk_alerts_anomaly
        FOREIGN KEY (anomaly_id) REFERENCES operational_anomalies (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_alerts_priority CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    CONSTRAINT chk_alerts_status CHECK (status IN ('OPEN', 'ACKNOWLEDGED', 'CLOSED')),
    INDEX idx_alerts_anomaly_time (anomaly_id, generated_at),
    INDEX idx_alerts_status_priority (status, priority)
) ENGINE = InnoDB
  COMMENT = 'Operational Intelligence: alert generated from an anomaly';

-- ---------------------------------------------------------------------------
-- Asset and Maintenance Management bounded context: maintenance history
-- ---------------------------------------------------------------------------

CREATE TABLE maintenance_records (
    id                          CHAR(36)      NOT NULL,
    machine_id                  CHAR(36)      NOT NULL,
    technician_membership_id    CHAR(36)      NOT NULL,
    anomaly_id                  CHAR(36)      NULL,
    maintenance_type            VARCHAR(20)   NOT NULL,
    performed_at                DATETIME(6)   NOT NULL,
    description                 VARCHAR(2000) NOT NULL,

    CONSTRAINT pk_maintenance_records PRIMARY KEY (id),
    CONSTRAINT fk_maintenance_records_machine
        FOREIGN KEY (machine_id) REFERENCES machines (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_maintenance_records_membership
        FOREIGN KEY (technician_membership_id) REFERENCES mill_memberships (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT fk_maintenance_records_anomaly
        FOREIGN KEY (anomaly_id) REFERENCES operational_anomalies (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_maintenance_records_type
        CHECK (maintenance_type IN ('PREVENTIVE', 'CORRECTIVE')),
    CONSTRAINT chk_maintenance_records_description CHECK (CHAR_LENGTH(TRIM(description)) > 0),
    CONSTRAINT chk_maintenance_records_anomaly
        CHECK (maintenance_type <> 'CORRECTIVE' OR anomaly_id IS NOT NULL),
    INDEX idx_maintenance_records_machine_time (machine_id, performed_at),
    INDEX idx_maintenance_records_membership (technician_membership_id),
    INDEX idx_maintenance_records_anomaly (anomaly_id)
) ENGINE = InnoDB
  COMMENT = 'Maintenance: preventive and corrective history for a machine';

-- ---------------------------------------------------------------------------
-- Reporting and Analytics bounded context
-- Projections are tenant-scoped through mill_id and rebuilt from published
-- events. They do not reference every source table because they are read models.
-- ---------------------------------------------------------------------------

CREATE TABLE report_rows (
    id              CHAR(36)    NOT NULL,
    mill_id         CHAR(36)    NOT NULL,
    report_type     VARCHAR(40) NOT NULL,
    period_start    DATE        NOT NULL,
    period_end      DATE        NOT NULL,
    generated_at    DATETIME(6) NOT NULL,

    CONSTRAINT pk_report_rows PRIMARY KEY (id),
    CONSTRAINT fk_report_rows_mill
        FOREIGN KEY (mill_id) REFERENCES rice_mills (id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT chk_report_rows_type
        CHECK (report_type IN ('OPERATIONAL_SUMMARY', 'PRODUCTION_REPORT', 'MAINTENANCE_REPORT', 'OPERATIONAL_TREND')),
    CONSTRAINT chk_report_rows_period CHECK (period_end >= period_start),
    INDEX idx_report_rows_mill_type_period (mill_id, report_type, period_start, period_end)
) ENGINE = InnoDB
  COMMENT = 'Reporting: tenant-scoped, rebuildable report projection header';

CREATE TABLE report_dimensions (
    report_row_id       CHAR(36)     NOT NULL,
    dimension_name      VARCHAR(80)  NOT NULL,
    dimension_value     VARCHAR(255) NOT NULL,

    CONSTRAINT pk_report_dimensions PRIMARY KEY (report_row_id, dimension_name),
    CONSTRAINT fk_report_dimensions_row
        FOREIGN KEY (report_row_id) REFERENCES report_rows (id)
        ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE = InnoDB
  COMMENT = 'Reporting: normalized dimensions for a projected row';

CREATE TABLE report_metrics (
    report_row_id   CHAR(36)      NOT NULL,
    metric_name     VARCHAR(80)   NOT NULL,
    measured_at     DATETIME(6)   NOT NULL,
    metric_value    DECIMAL(18,4) NOT NULL,
    unit            VARCHAR(30)   NOT NULL,

    CONSTRAINT pk_report_metrics PRIMARY KEY (report_row_id, metric_name, measured_at),
    CONSTRAINT fk_report_metrics_row
        FOREIGN KEY (report_row_id) REFERENCES report_rows (id)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    INDEX idx_report_metrics_name_time (metric_name, measured_at)
) ENGINE = InnoDB
  COMMENT = 'Reporting: normalized metrics and trend points for a projected row';
