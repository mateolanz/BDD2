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



/*3- Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.*/
ALTER TABLE employees 
ADD age TINYINT,
ADD CONSTRAINT ageCheck CHECK(age >= 16 and age <= 70);



/*4- Describe the referential integrity between tables film, actor and film_actor in sakila db.
film_actor contiene id's de actors y films, siendo una "conexión" que permite ver en que películas actua cada actor y que actores actuan en cada película
*/



/*5- Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated on inserts and updates operations.
Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who was the last MySQL user that changed the row
(assume multiple users, other than root, can connect to MySQL and change this table).*/
select * FROM employees;

ALTER TABLE employees 
ADD lastUpdate DATETIME;
ALTER TABLE employees
ADD lastUpdateUser VARCHAR(30);

CREATE TRIGGER employees_before_update
	BEFORE UPDATE ON employees
	FOR EACH ROW
BEGIN
	SET NEW.lastUpdate = NOW();
	SET NEW.lastUpdateUser = SESSION_USER();
END;



/*6- Find all the triggers in sakila db related to loading film_text table. What do they do? Explain each of them using its source code for the explanation.*/

-- sakila.film_text definition
CREATE TABLE `film_text` (
  `film_id` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`film_id`),
  FULLTEXT KEY `idx_title_description` (`title`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*triggers: */
CREATE DEFINER=`user`@`%` TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END
/*cuando se agrega una film se agrega tambien en sakila.film_tex */

CREATE DEFINER=`user`@`%` TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END
/*cuando se actualiza una film se actualiza tambien en sakila.film_tex*/

CREATE DEFINER=`user`@`%` TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END
/*cuando se elimina una film se elimina tambien en sakila.film_tex*/
