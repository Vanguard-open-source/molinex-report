-- Owner: Quality and Yield Control
-- Status: IMPLEMENTED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Offline Hibernate 7.4.13.Final metadata from molinex-platform-backend at 1b6311c64d0559398732838b87359e59ed6c87a4; MySQLDialect and snake_case naming.

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
