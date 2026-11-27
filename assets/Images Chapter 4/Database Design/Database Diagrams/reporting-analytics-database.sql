-- Owner: Reporting and Analytics
-- Status: PROPOSED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Target backend class diagram: backend-reporting-analytics-class-diagram.puml; no implemented JPA module.

-- MetricProjection / projection
-- Proposed local reporting projection reconstructed from published operational events.
-- REF source_aggregate_id: Aggregate identity in the context named by source_context; no physical FK.
CREATE TABLE `metric_projections` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `source_context` VARCHAR(100) NOT NULL,
    `source_aggregate_id` BIGINT NOT NULL,
    `category` ENUM ('OPERATIONAL','PRODUCTION','QUALITY','MAINTENANCE') NOT NULL,
    `metric_name` VARCHAR(100) NOT NULL,
    `metric_value` DECIMAL(18,4) NOT NULL,
    `unit` VARCHAR(30) NOT NULL,
    `measured_at` DATETIME(6) NOT NULL,
    `dimensions_json` JSON NOT NULL,
    CONSTRAINT `pk_metric_projections` PRIMARY KEY (`id`)
) ENGINE=InnoDB;
