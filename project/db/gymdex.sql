DROP TABLE customers_sessions;
DROP TABLE customers;
DROP TABLE sessions;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  membership_type VARCHAR(255),
  membership_status BOOLEAN
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  starting_time VARCHAR(255),
  type VARCHAR(255),
  status BOOLEAN,
  max_capacity INT,
  current_capacity INT
);

CREATE TABLE customers_sessions (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  session_id INT REFERENCES sessions(id)
);
