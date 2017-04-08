
DROP TABLE IF EXISTS test_data;
CREATE TABLE test_data (
  id INT PRIMARY KEY,
  test_text VARCHAR(100),
  test_number DOUBLE,
  test_date TIMESTAMP,
  "white space" BOOLEAN
);

DROP TABLE IF EXISTS test_data_2;
CREATE TABLE test_data_2 (
  id INT PRIMARY KEY,
  test_text VARCHAR(100),
  test_number DOUBLE,
  test_date TIMESTAMP
);