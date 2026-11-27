-- Owner: Production Management
-- Status: IMPLEMENTED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Offline Hibernate 7.4.13.Final metadata from molinex-platform-backend at 1b6311c64d0559398732838b87359e59ed6c87a4; MySQLDialect and snake_case naming.

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
