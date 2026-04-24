CREATE TABLE IF NOT EXISTS Credits(
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` NVARCHAR(64) NOT NULL, /* Name of the credit */
  `need_all` BOOLEAN NOT NULL DEFAULT FALSE /* Whether a student needs all classes with the credit to obtain the credit */
);