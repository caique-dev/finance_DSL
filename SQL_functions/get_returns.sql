CREATE OR REPLACE FUNCTION get_returns(
    p_ticker TEXT,
    p_start DATE,
    p_end DATE
)
RETURNS TABLE (
    ref_date DATE,
    ret NUMERIC
)
LANGUAGE sql
AS $$
    SELECT
        p.date AS ref_date,
        (p.close / LAG(p.close) OVER (ORDER BY p.date)) - 1 AS ret
    FROM prices p
    JOIN assets a ON a.id = p.asset_id
    WHERE a.ticker = p_ticker
      AND p.date BETWEEN p_start AND p_end
    ORDER BY p.date;
$$;
