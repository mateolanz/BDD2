/*1- Insert a new employee to , but with an null email. Explain what happens.*/
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (69,'Perez', 'Juancito', 'x420', NULL, '2', '1002', 'gerent');

/*
SQL Error [1048] [23000]: Column 'email' cannot be null
Columna 'email' no puede ser NULL
 */
 
 
 
