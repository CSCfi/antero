TRUNCATE TABLE test_data;
INSERT INTO test_data (id, test_text, test_number, test_date, "white space", defaultorder) VALUES
  (1, 'c text value', 3.11, '2017-01-01 00:00:00+00:00', 1, 3),
  (2, 'a text value', 2.11, '2014-01-02 00:00:00+00:00', 1, 4),
  (3, 'b text value', 4.11, '2013-01-03 00:00:00+00:00', 0, 1),
  (4, 'd text value', 1.11, '2017-01-04 00:00:00+00:00', 0, 2);