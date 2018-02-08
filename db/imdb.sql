
DROP TABLE movies CASCADE;
DROP TABLE actors CASCADE;
DROP TABLE castings CASCADE;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  rating INT
);

CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
  actor_id INT REFERENCES actors(id) ON DELETE CASCADE,
  fee INT
);
