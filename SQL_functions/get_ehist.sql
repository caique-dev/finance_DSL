CREATE OR REPLACE FUNCTION get_ehist(
    p_ticker TEXT
)
RETURNS DATE
LANGUAGE sql
AS $$
    SELECT MAX(p.date)
    FROM prices p
    JOIN assets a ON a.id = p.asset_id
    WHERE a.ticker = p_ticker;
$$;
