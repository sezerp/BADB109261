CREATE DATABASE IF NOT EXISTS fakturowanie;
ALTER SCHEMA fakturowanie CHARACTER SET utf8 COLLATE utf8_polish_ci;

CREATE USER IF NOT EXISTS 'liquibase_user'@'%' IDENTIFIED BY 'sm@l0@t@';
GRANT ALL PRIVILEGES ON fakturowanie.* TO 'liquibase_user'@'%' WITH GRANT OPTION;