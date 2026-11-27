-- Molinex: implemented persistence only, grouped by owning Bounded Context.
-- Derived offline from the reviewed JPA mappings; not a deployed-database export.
-- Proposed Operational Intelligence and Reporting schemas are separate files.
-- Physical FKs never cross Bounded Contexts. Internal FKs do not define aggregate ownership.
-- MySQL 8.0+. This is reference DDL for an empty schema, not an ALTER migration.
CREATE DATABASE IF NOT EXISTS molinex CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE molinex;

-- ===== Production Management =====
-- RawMaterialReception / root
-- Reception root; supplier, origin and weight values are flattened into this table.
CREATE TABLE `raw_material_receptions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `origin_description` VARCHAR(255) NOT NULL,
    `quantity_unit` VARCHAR(30) NOT NULL,
    `quantity_value` DECIMAL(18,4) NOT NULL,
    `received_at` DATETIME(6) NOT NULL,
    `supplier_name` VARCHAR(150) NOT NULL,
    CONSTRAINT `pk_raw_material_receptions` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ProductionBatch / root
-- Independent batch root, referencing a reception by identity.
CREATE TABLE `production_batches` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(50) NOT NULL,
    `registered_at` DATETIME(6) NOT NULL,
    `reception_id` BIGINT NOT NULL,
    CONSTRAINT `pk_production_batches` PRIMARY KEY (`id`),
    CONSTRAINT `uk_production_batch_code` UNIQUE (`code`),
    CONSTRAINT `FKrrw0g0rx39ovxblgpgdbqruaf` FOREIGN KEY (`reception_id`) REFERENCES `raw_material_receptions` (`id`)
) ENGINE=InnoDB;

-- ProductionRecord / root
-- Independent process record root, referencing a batch by identity.
CREATE TABLE `production_records` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `finished_at` DATETIME(6) NULL,
    `process_name` VARCHAR(120) NOT NULL,
    `processed_weight_unit` ENUM ('KILOGRAM','METRIC_TON') NOT NULL,
    `processed_weight_value` DECIMAL(18,4) NOT NULL,
    `recorded_at` DATETIME(6) NOT NULL,
    `started_at` DATETIME(6) NOT NULL,
    `status` ENUM ('COMPLETED','IN_PROGRESS','REGISTERED') NOT NULL,
    `batch_id` BIGINT NOT NULL,
    CONSTRAINT `pk_production_records` PRIMARY KEY (`id`),
    CONSTRAINT `FKf7rxtw0144bgfpvb2d3nllhr8` FOREIGN KEY (`batch_id`) REFERENCES `production_batches` (`id`),
    INDEX `ix_production_records_recorded_at` (`recorded_at`)
) ENGINE=InnoDB;

-- ===== Quality and Yield Control =====
-- QualityAssessment / root
-- Assessment root; owns its immutable measurement values.
-- REF production_record_id: Production Management / production_records.id (via ExternalProductionService); no physical FK.
CREATE TABLE `quality_assessments` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `assessed_at` DATETIME(6) NOT NULL,
    `production_record_id` BIGINT NOT NULL,
    CONSTRAINT `pk_quality_assessments` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- QualityAssessment / owned-values
-- Owned persistence rows for the QualityMeasurement domain value object.
CREATE TABLE `quality_measurements` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `expected_max_percentage` DECIMAL(5,2) NOT NULL,
    `expected_min_percentage` DECIMAL(5,2) NOT NULL,
    `indicator` ENUM ('BROKEN_GRAIN_PERCENTAGE','WHOLE_GRAIN_PERCENTAGE','YIELD_PERCENTAGE') NOT NULL,
    `value_percentage` DECIMAL(5,2) NOT NULL,
    `assessment_id` INT NOT NULL,
    CONSTRAINT `pk_quality_measurements` PRIMARY KEY (`id`),
    CONSTRAINT `UK4w1ncg9n6sv1vtuov8ntvp036` UNIQUE (`assessment_id`, `indicator`),
    CONSTRAINT `FKeijshdd9ih3lu73kar4vaxjg8` FOREIGN KEY (`assessment_id`) REFERENCES `quality_assessments` (`id`)
) ENGINE=InnoDB;

-- WasteRecord / root
-- Independent waste root; embeds quantity, base weight and optional percentage values.
-- REF production_record_id: Production Management / production_records.id (via ExternalProductionService); no physical FK.
CREATE TABLE `waste_records` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `base_weight_unit` ENUM ('KILOGRAM','METRIC_TON') NULL,
    `base_weight_value` DECIMAL(18,4) NULL,
    `percentage` DECIMAL(5,2) NULL,
    `production_record_id` BIGINT NOT NULL,
    `quantity_unit` ENUM ('KILOGRAM','METRIC_TON') NOT NULL,
    `quantity_value` DECIMAL(18,4) NOT NULL,
    `recorded_at` DATETIME(6) NOT NULL,
    CONSTRAINT `pk_waste_records` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ===== Asset and Maintenance Management =====
-- Machine / root
-- Machine root; code, name, model and status stay inside this context.
CREATE TABLE `machines` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `code` VARCHAR(50) NOT NULL,
    `model` VARCHAR(120) NOT NULL,
    `name` VARCHAR(120) NOT NULL,
    `status` ENUM ('OPERATIONAL','OUT_OF_SERVICE','REQUIRES_ATTENTION','UNDER_MAINTENANCE') NOT NULL,
    `status_changed_at` DATETIME(6) NULL,
    CONSTRAINT `pk_machines` PRIMARY KEY (`id`),
    CONSTRAINT `uq_machines_code` UNIQUE (`code`)
) ENGINE=InnoDB;

-- MaintenanceRecord / root
-- Independent maintenance root; technician and corrective details are embedded snapshots.
-- REF anomaly_id: Operational Intelligence / operational_anomalies.id (planned integration); no physical FK.
-- REF machine_id: Asset and Maintenance Management / machines.id (same BC, scalar reference); no physical FK.
-- REF principal_id: Identity and Access Management / authenticated principal subject; no physical FK.
CREATE TABLE `maintenance_records` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `anomaly_id` BIGINT NULL,
    `action_taken` VARCHAR(2000) NULL,
    `cause` VARCHAR(2000) NULL,
    `downtime_minutes` INT NULL,
    `failure` VARCHAR(2000) NULL,
    `description` VARCHAR(2000) NOT NULL,
    `machine_id` BIGINT NOT NULL,
    `performed_at` DATETIME(6) NOT NULL,
    `display_name` VARCHAR(150) NOT NULL,
    `principal_id` BIGINT NOT NULL,
    `type` ENUM ('CORRECTIVE','PREVENTIVE') NOT NULL,
    CONSTRAINT `pk_maintenance_records` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ===== Commercial Engagement =====
-- CommercialInquiry / root
-- Commercial inquiry root with embedded contact details.
CREATE TABLE `commercial_inquiries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `company_name` VARCHAR(150) NOT NULL,
    `email` VARCHAR(254) NOT NULL,
    `full_name` VARCHAR(150) NOT NULL,
    `phone_number` VARCHAR(30) NULL,
    `message` VARCHAR(2000) NOT NULL,
    `submitted_at` DATETIME(6) NOT NULL,
    CONSTRAINT `pk_commercial_inquiries` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ===== Identity and Access Management =====
-- User / root
-- User root; EmailAddress, PasswordHash and UserProfile are converted scalar values.
CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    `credential` VARCHAR(255) NOT NULL,
    `email` VARCHAR(254) NOT NULL,
    `profile` VARCHAR(150) NOT NULL,
    `role` ENUM ('ADMINISTRATOR','OPERATOR','TECHNICIAN') NOT NULL,
    `status` ENUM ('ACTIVE','INACTIVE','LOCKED') NOT NULL,
    CONSTRAINT `pk_users` PRIMARY KEY (`id`),
    CONSTRAINT `uq_users_email` UNIQUE (`email`)
) ENGINE=InnoDB;
