-- Owner: Operational Intelligence
-- Status: PROPOSED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Target backend class diagram: backend-operational-intelligence-class-diagram.puml; no implemented JPA module.

-- OperationalReading / root
-- Proposed reading root; machine belongs to Asset and Maintenance Management.
-- REF machine_id: Asset and Maintenance Management / machines.id; no physical FK.
CREATE TABLE `operational_readings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `machine_id` BIGINT NOT NULL,
    `variable_name` VARCHAR(100) NOT NULL,
    `measurement_value` DECIMAL(18,4) NOT NULL,
    `unit_symbol` VARCHAR(30) NOT NULL,
    `recorded_at` DATETIME(6) NOT NULL,
    CONSTRAINT `pk_operational_readings` PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- OperationalAnomaly / root
-- Proposed anomaly root; evaluation bounds are embedded in the anomaly.
CREATE TABLE `operational_anomalies` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reading_id` BIGINT NOT NULL,
    `minimum_value` DECIMAL(18,4) NOT NULL,
    `maximum_value` DECIMAL(18,4) NOT NULL,
    `detected_at` DATETIME(6) NOT NULL,
    `status` ENUM ('DETECTED','ACKNOWLEDGED','RESOLVED') NOT NULL,
    CONSTRAINT `pk_operational_anomalies` PRIMARY KEY (`id`),
    CONSTRAINT `fk_operational_anomalies_reading` FOREIGN KEY (`reading_id`) REFERENCES `operational_readings` (`id`)
) ENGINE=InnoDB;

-- Alert / root
-- Proposed alert root with its own lifecycle.
CREATE TABLE `alerts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `anomaly_id` BIGINT NOT NULL,
    `priority` ENUM ('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL,
    `status` ENUM ('OPEN','ACKNOWLEDGED','CLOSED') NOT NULL,
    `generated_at` DATETIME(6) NOT NULL,
    CONSTRAINT `pk_alerts` PRIMARY KEY (`id`),
    CONSTRAINT `fk_alerts_anomaly` FOREIGN KEY (`anomaly_id`) REFERENCES `operational_anomalies` (`id`)
) ENGINE=InnoDB;
