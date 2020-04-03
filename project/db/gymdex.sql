DROP TABLE customers_sessions;
DROP TABLE customers;
DROP TABLE sessions;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  membership_type VARCHAR(255),
  membership_status VARCHAR(255) NOT NULL
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  starting_time VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL,
  max_capacity INT NOT NULL,
  current_capacity INT
);

CREATE TABLE customers_sessions (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  session_id INT REFERENCES sessions(id)
);
