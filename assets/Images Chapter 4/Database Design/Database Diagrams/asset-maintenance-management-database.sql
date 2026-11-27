-- Owner: Asset and Maintenance Management
-- Status: IMPLEMENTED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Offline Hibernate 7.4.13.Final metadata from molinex-platform-backend at 1b6311c64d0559398732838b87359e59ed6c87a4; MySQLDialect and snake_case naming.

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
