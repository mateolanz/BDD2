USE imdb;

CREATE TABLE IF NOT EXISTS film
(
    film_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(20),
    description VARCHAR,
    release_year YEAR,
    CONSTRAINT pk PRIMARY KEY (film_id)
);


CREATE TABLE IF NOT EXISTS actor
(
    actor_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    CONSTRAINT pk PRIMARY KEY (actor_id)
);

CREATE TABLE if NOT EXISTS film_actor
(
	actor_id INT,
	film_id INT
);

ALTER TABLE film ADD COLUMN last_update DATE;
ALTER TABLE actor ADD COLUMN last_update DATE;
ALTER TABLE film_actor ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE film_actor ADD CONSTRAINT fk_autor FOREIGN KEY (actor_id) REFERENCES actor(actor_id);


INSERT INTO film (title, description, release_year) VALUE('Spongebob The Movie 3', 'La última película de la trilogía de Bob Esponja', '2022');
INSERT INTO film (title, description, release_year) VALUE('Messi: el documental', 'La película de Lionel Messi', '2015');
INSERT INTO film (title, description, release_year) VALUE('Shirley', 'La ovejita Shirley', '1994');

INSERT INTO actor (first_name, last_name) VALUE('Bob Esponja', 'Pantalones Cuadrados');
INSERT INTO actor (first_name, last_name) VALUE('Lionel', 'Messi');
INSERT INTO actor (first_name, last_name) VALUE('Cristiano', 'Ronaldo');
INSERT INTO actor (first_name, last_name) VALUE('Jamie', 'Foxx');
INSERT INTO actor (first_name, last_name) VALUE('Oscar', 'Isaac');
INSERT INTO actor (first_name, last_name) VALUE('Angelina', 'Jolie');

INSERT INTO film_actor (actor_id, film_id) VALUE(1, 1);
INSERT INTO film_actor (actor_id, film_id) VALUE(2, 2);
INSERT INTO film_actor (actor_id, film_id) VALUE(3, 2);
INSERT INTO film_actor (actor_id, film_id) VALUE(4, 3);
INSERT INTO film_actor (actor_id, film_id) VALUE(5, 3);
INSERT INTO film_actor (actor_id, film_id) VALUE(6, 3);