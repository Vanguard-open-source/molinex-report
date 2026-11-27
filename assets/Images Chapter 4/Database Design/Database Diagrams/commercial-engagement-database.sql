-- Owner: Commercial Engagement
-- Status: IMPLEMENTED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Offline Hibernate 7.4.13.Final metadata from molinex-platform-backend at 1b6311c64d0559398732838b87359e59ed6c87a4; MySQLDialect and snake_case naming.

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
