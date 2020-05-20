CREATE DATABASE IF NOT EXISTS baza_danych;
ALTER SCHEMA baza_danych CHARACTER SET utf8 COLLATE utf8_polish_ci;

CREATE USER IF NOT EXISTS 'liquibase_user'@'%' IDENTIFIED BY 'sm@l0@t@';
GRANT ALL PRIVILEGES ON baza_danych.* TO 'liquibase_user'@'%' WITH GRANT OPTION;