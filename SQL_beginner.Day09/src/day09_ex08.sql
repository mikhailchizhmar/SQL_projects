CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(x INTEGER) AS $$
WITH RECURSIVE t AS (
SELECT 0 AS x, 1 AS y
UNION ALL
SELECT y, x + y
FROM t
WHERE y < pstop)
SELECT x
FROM t;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();