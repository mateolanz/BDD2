/*1- Insert a new employee to , but with an null email. Explain what happens.*/
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (69,'Perez', 'Juancito', 'x420', NULL, '2', '1002', 'gerent');

/*
SQL Error [1048] [23000]: Column 'email' cannot be null
Columna 'email' no puede ser NULL
 */
 
 
 
 /*2- Run the first the query*/
UPDATE employees SET employeeNumber = employeeNumber - 20;
/*What did happen?
Está a punto de ejecutar una instrucción UPDATE sin una cláusula WHERE en "employees". Posible pérdida de datos
Básicamente, la función va a modificar los datos de todos los employees, entonces consulta si estoy seguro ejecutando la query
Explain. Then run this other
*/

UPDATE employees SET employeeNumber = employeeNumber + 20;
/*Explain this case also.
Este caso es igual, con la diferencia de que, al darle 'aceptar' no se puede ejecutar:
SQL Error [1062] [23000]: Duplicate entry '1056' for key 'employees.PRIMARY'
En resumen, como hay employee 1036, este pasaía a ser 1056 pero ya hay un 1056*/
