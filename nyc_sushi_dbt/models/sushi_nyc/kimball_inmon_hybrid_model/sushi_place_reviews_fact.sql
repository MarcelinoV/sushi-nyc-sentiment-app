{{ config(materialized='table') }}

WITH SUSHI_PLACE_REVIEWS_FACT AS (
SELECT SPLIT_PART(NAME, '/', 4) AS REVIEW_ID,
       PLACE_ID,
       AUTHOR,
       RATING,
       TEXT,
       PUBLISHTIME,
       GOOGLEMAPSURI,
       CURRENT_DATE AS LOAD_DATE
FROM {{ source('raw_data_sources', 'RAW_SUSHI_REVIEWS') }}
)

SELECT *
FROM SUSHI_PLACE_REVIEWS_FACT