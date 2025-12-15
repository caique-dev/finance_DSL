CREATE OR REPLACE FUNCTION get_shist(
    p_ticker TEXT
)
RETURNS DATE
LANGUAGE sql
AS $$
    SELECT MIN(p.date)
    FROM prices p
    JOIN assets a ON a.id = p.asset_id
    WHERE a.ticker = p_ticker;
$$;
