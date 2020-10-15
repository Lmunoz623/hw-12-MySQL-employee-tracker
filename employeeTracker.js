const mysql = require("mysql");
const inquirer = require("inquirer");
const cTable = require('console.table');


// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "Snapple20",
  database: "employee_tracker_db"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  start();
});

// function which prompts the user for what action they should take
function start() {
    inquirer
      .prompt({
        name: "action",
        type: "list",
        message: "What would you like to do?",
        choices: 
        [
            "ADD a new department", 
            "ADD a new role", 
            "ADD a new employee",
            "VIEW all current departments",
            "VIEW all current roles",
            "VIEW all current employees",
            "UPDATE an emplyee's role",
        ]
      })
      .then(function(answer) {
        switch (answer.action) {
        case "ADD a new department":
            addDepartment();
            break;

        case "ADD a new role":
            addRole();
            break;

        case "ADD a new employee":
            addEmployee();
            break;

        case "VIEW all current departments":
            viewDepartments();
            break;

        case "VIEW all current roles":
            viewRoles();
            break;

        case "VIEW all current employees":
            viewEmployees();
            break;

        case "UPDATE an employee's role":
            updateEmployeeRole();
            break;

        case "exit":
            connection.end();
            break;
      }
    })

  function viewDepartments() {
      connection.query = "SELECT * FROM departments;", function(err, data) {
        if (err) {
            throw err;
          }
          console.log(departments: data)
      }
  }

  function addDepartment() {
      inquirer
        .prompt([
            {
                name: "newDept",
                type: "input",
                message: "What is the name of the new department?"
            }
        ])
  }
  function addRole() {
      inquirer
        .prompt([
            {
                name: "newRole",
                type: "input",
                message: "What is the new role's title?"
            },
            {
                name: "salary",
                type: "input",
                message: "What is the new role's salary?" 
            },
            {
                name: "department",
                type: "list",
                message: "In which department will the new role be?"
                choices:
                [
                    ...departmets
                ] 
            }
        ])

  }
  function addEmployee() {
      inquirer
        .prompt([
            {
                name: "firstName",
                type: "input",
                message: "What is the employee's first name?"
            },
            {
                name: "lastName",
                type: "input",
                message: "What is the employee's last name?"
            },
            {
                name: "role",
                type: "list",
                message: "What is the employee's role?"
                choices:
                [
                    ...roles
                ] 
            }

        ])

  }

  function updateEmployeeRole() {
      inquirer
        .prompt([
            {
                name: "employee",
                type: "list",
                message: "Select an employee?"
                choices:
                [
                    ...employees
                ] 
            },
            {
                name: "role",
                type: "list",
                message: "Select a role?"
                choices:
                [
                    ...roles
                ]  
            }
        ])

    }

};