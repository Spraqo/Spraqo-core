CREATE DATABASE IF NOT EXISTS 'spraqo-core';
use `spraqo-core`;

CREATE TABLE `users` (
    `identifier` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`identifier`)

)