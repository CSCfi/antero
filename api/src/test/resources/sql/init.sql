CREATE TABLE test_data (
  id INT PRIMARY KEY,
  test_text VARCHAR(100),
  test_number DOUBLE,
  test_date TIMESTAMP,
  "white space" BOOLEAN,
  defaultorder INT AUTO_INCREMENT
);

CREATE TABLE test_data_2 (
  id INT PRIMARY KEY,
  test_text VARCHAR(100),
  test_number DOUBLE,
  test_date TIMESTAMP,
  defaultorder INT AUTO_INCREMENT
);

INSERT INTO test_data (id, test_text, test_number, test_date, "white space") VALUES
  (1, 'text value', 1.11, '2017-01-01 00:00:00+00:00', 1),
  (2, 'text value 2', 2.22, '2017-02-02 00:00:00+00:00', 0);

INSERT INTO test_data_2 (id, test_text, test_number, test_date) VALUES
  (1, 'text value', 1.11, '2017-01-01 00:00:00+00:00'),
  (2, 'text value 2', 2.22, '2017-02-02 00:00:00+00:00');