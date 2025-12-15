CREATE OR REPLACE FUNCTION get_risk(
    p_ticker TEXT,
    p_start DATE,
    p_end DATE
)
RETURNS NUMERIC
LANGUAGE sql
AS $$
    SELECT
        STDDEV(ret)
    FROM get_returns(p_ticker, p_start, p_end)
    WHERE ret IS NOT NULL;
$$;
