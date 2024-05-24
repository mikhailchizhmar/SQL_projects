CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
SELECT MIN(val)
FROM UNNEST(arr) AS t(val);
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
SELECT func_minimum(10.0, 5.0, 4.4, 2.7, -99);