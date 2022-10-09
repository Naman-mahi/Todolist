CREATE TABLE `ticketit_statuses`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` BIGINT NOT NULL
);
ALTER TABLE
    `ticketit_statuses` ADD PRIMARY KEY `ticketit_statuses_id_primary`(`id`);
CREATE TABLE `ticketit_priorities`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` BIGINT NOT NULL
);
ALTER TABLE
    `ticketit_priorities` ADD PRIMARY KEY `ticketit_priorities_id_primary`(`id`);
CREATE TABLE `Ticket_users`(
    `user_id` INT NOT NULL,
    `usertype` INT NOT NULL
);
ALTER TABLE
    `Ticket_users` ADD PRIMARY KEY `ticket_users_user_id_primary`(`user_id`);
CREATE TABLE `dashboard_table`(
    `id` INT NOT NULL,
    `user` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `assign` LONGTEXT NULL,
    `status_id` INT NOT NULL,
    `priority_id` INT NOT NULL,
    `Team` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` BIGINT NOT NULL,
    `completed_at` TIMESTAMP NULL
);
ALTER TABLE
    `dashboard_table` ADD PRIMARY KEY `dashboard_table_id_primary`(`id`);
ALTER TABLE
    `dashboard_table` ADD INDEX `dashboard_table_user_index`(`user`);
ALTER TABLE
    `dashboard_table` ADD INDEX `dashboard_table_status_id_index`(`status_id`);
ALTER TABLE
    `dashboard_table` ADD INDEX `dashboard_table_priority_id_index`(`priority_id`);
ALTER TABLE
    `dashboard_table` ADD INDEX `dashboard_table_team_index`(`Team`);
ALTER TABLE
    `dashboard_table` ADD INDEX `dashboard_table_completed_at_index`(`completed_at`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `admin` TINYINT(1) NOT NULL,
    `Team` TINYINT(1) NOT NULL
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
CREATE TABLE `AdminAccess`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `datetime` DATETIME NOT NULL
);
ALTER TABLE
    `AdminAccess` ADD PRIMARY KEY `adminaccess_id_primary`(`id`);
CREATE TABLE `TeamAccess`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `date` DATETIME NOT NULL
);
ALTER TABLE
    `TeamAccess` ADD PRIMARY KEY `teamaccess_id_primary`(`id`);
CREATE TABLE `Ticketform`(
    `ticketformid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `school` VARCHAR(255) NOT NULL,
    `role` ENUM('') NOT NULL,
    `ticketsubject` VARCHAR(255) NOT NULL,
    `attachment` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Ticketform` ADD PRIMARY KEY `ticketform_ticketformid_primary`(`ticketformid`);
CREATE TABLE `password_reset`(
    `email/username` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `create_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `password_reset` ADD PRIMARY KEY `password_reset_email/username_primary`(`email/username`);
CREATE TABLE `team_registration`(
    `team_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `team_registration` ADD PRIMARY KEY `team_registration_team_id_primary`(`team_id`);
ALTER TABLE
    `dashboard_table` ADD CONSTRAINT `dashboard_table_priority_id_foreign` FOREIGN KEY(`priority_id`) REFERENCES `ticketit_priorities`(`id`);
ALTER TABLE
    `dashboard_table` ADD CONSTRAINT `dashboard_table_status_id_foreign` FOREIGN KEY(`status_id`) REFERENCES `ticketit_statuses`(`id`);
ALTER TABLE
    `dashboard_table` ADD CONSTRAINT `dashboard_table_team_foreign` FOREIGN KEY(`Team`) REFERENCES `users`(`id`);
ALTER TABLE
    `Ticket_users` ADD CONSTRAINT `ticket_users_usertype_foreign` FOREIGN KEY(`usertype`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_admin_foreign` FOREIGN KEY(`admin`) REFERENCES `AdminAccess`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_team_foreign` FOREIGN KEY(`Team`) REFERENCES `team_registration`(`team_id`);
ALTER TABLE
    `TeamAccess` ADD CONSTRAINT `teamaccess_username_foreign` FOREIGN KEY(`username`) REFERENCES `password_reset`(`email/username`);