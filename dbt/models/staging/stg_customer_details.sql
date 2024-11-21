
WITH raw_customer_details AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        phone_number,
        address,
        segment_id,
        country_code
    FROM {{ source('travel_project', 'customer_details') }}
)

SELECT * 
FROM raw_customer_details

