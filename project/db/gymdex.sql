DROP TABLE bookings;
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
  starting_time TIME(0),
  type VARCHAR(255),
  status BOOLEAN,
  max_capacity INT
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);
