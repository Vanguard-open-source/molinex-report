-- Owner: Identity and Access Management
-- Status: IMPLEMENTED
-- Select an empty MySQL schema before executing this standalone context DDL.
-- Source: Offline Hibernate 7.4.13.Final metadata from molinex-platform-backend at 1b6311c64d0559398732838b87359e59ed6c87a4; MySQLDialect and snake_case naming.

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
