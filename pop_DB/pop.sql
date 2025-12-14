INSERT INTO prices (
    asset_id, date, open, close, low, high, volume, variation
)
SELECT
    (SELECT id FROM assets WHERE ticker = 'EMBJ3'),

    TO_DATE(date_raw, 'DD.MM.YYYY'),

    REPLACE(open_raw,  ',', '.')::NUMERIC,
    REPLACE(close_raw, ',', '.')::NUMERIC,
    REPLACE(low_raw,   ',', '.')::NUMERIC,
    REPLACE(high_raw,  ',', '.')::NUMERIC,

    CASE
	    WHEN volume_raw IS NULL OR volume_raw = '' THEN NULL
	
	    WHEN volume_raw ILIKE '%M' THEN
	        (REPLACE(REPLACE(volume_raw, 'M', ''), ',', '.')::NUMERIC * 1000000)::BIGINT
	
	    WHEN volume_raw ILIKE '%K' THEN
	        (REPLACE(REPLACE(volume_raw, 'K', ''), ',', '.')::NUMERIC * 1000)::BIGINT
	
	    ELSE
	        NULL
	END
,

    (
        REPLACE(
            REPLACE(NULLIF(variation_raw, ''), '%', ''),
            ',', '.'
        )::NUMERIC / 100
    )

FROM prices_staging
WHERE
    open_raw  <> ''
    AND close_raw <> ''
    AND low_raw   <> ''
    AND high_raw  <> ''
ON CONFLICT (asset_id, date) DO NOTHING;
TRUNCATE prices_staging;