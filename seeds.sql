/* Seeds for SQL table. */
USE employee_tracker_db;


INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Shane", "Max", 1, 8);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Becket", "John", 5, 10);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Moseby", "Merry", 6, null);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Jones", "George", 1, 8);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Crosby", "Grover", 1, 8);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Polk", "T.J.", 3, null);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Binx", "Thackery", 5, 10);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Martinez", "Felix", 2, 3);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Campos", "Bruce", 3, null);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Ramos", "Anita", 4, 3);

INSERT INTO departments (name) VALUES ("Insurance Services");
INSERT INTO departments (name) VALUES ("Management");
INSERT INTO departments (name) VALUES ("Sales");
INSERT INTO departments (name) VALUES ("Legal");

INSERT INTO roles (title, salary, department_id) VALUES ("Customer Service Rep", 36000, 1);
INSERT INTO roles (title, salary, department_id) VALUES ("CS Team Lead", 38000, 1);
INSERT INTO roles (title, salary, department_id) VALUES ("Lawyer", 100000, 4);
INSERT INTO roles (title, salary, department_id) VALUES ("Sales Lead", 45000, 3);
INSERT INTO roles (title, salary, department_id) VALUES ("Salesperson", 40000, 3);
INSERT INTO roles (title, salary, department_id) VALUES ("Supervisor", 55000, 2);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM roles;

/* JOIN required information from all 3 tables. */
SELECT e.id, e.first_name, e.last_name, r.title, d.name, r.salary, e.manager_id AS manager
FROM roles r
JOIN departments d ON r.department_id = d.id
JOIN employees e ON e.role_id = r.id;