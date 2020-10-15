-- Drops the employee_tracker_db if it already exists --
DROP DATABASE IF EXISTS employee_tracker_db;

-- Create the database employee_tracker_db and specified it for use.
CREATE DATABASE employee_tracker_db;

USE employee_tracker_db;

-- Create the tables.
CREATE TABLE employees (
  id INTEGER(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  role_id INTEGER(10) NOT NULL, 
  manager_id INTEGER(10)
);

CREATE TABLE departments (
  id INTEGER(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL
  );

CREATE TABLE roles (
  id INTEGER(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  title varchar(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INTEGER(10) NOT NULL
);