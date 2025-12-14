CREATE OR REPLACE FUNCTION get_price(
    p_ticker TEXT,
    p_date   DATE
)
RETURNS NUMERIC AS $$
DECLARE
    v_price NUMERIC;
BEGIN
    SELECT p.close
    INTO v_price
    FROM prices p
    JOIN assets a ON a.id = p.asset_id
    WHERE a.ticker = p_ticker
      AND p.date = p_date;

    RETURN v_price;
END;
$$ LANGUAGE plpgsql STABLE;
