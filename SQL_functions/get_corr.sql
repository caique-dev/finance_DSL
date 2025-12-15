CREATE OR REPLACE FUNCTION get_corr(
    p_ticker_1 TEXT,
    p_ticker_2 TEXT,
    p_start DATE,
    p_end DATE
)
RETURNS NUMERIC
LANGUAGE sql
AS $$
    SELECT
        CORR(r1.ret, r2.ret)
    FROM get_returns(p_ticker_1, p_start, p_end) r1
    JOIN get_returns(p_ticker_2, p_start, p_end) r2
      ON r1.ref_date = r2.ref_date
    WHERE r1.ret IS NOT NULL
      AND r2.ret IS NOT NULL;
$$;
