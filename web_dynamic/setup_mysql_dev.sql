-- prepares a MySQL server for the project

CREATE DATABASE IF NOT EXISTS renthub;
CREATE USER IF NOT EXISTS 'renthub_dev'@'localhost' IDENTIFIED BY 'renthub_pwd';
GRANT ALL PRIVILEGES ON `renthub`.* TO 'renthub_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'renthub_dev'@'localhost';
FLUSH PRIVILEGES;
