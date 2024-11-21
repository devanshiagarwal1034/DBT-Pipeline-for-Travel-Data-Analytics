-- models/staging/stg_booking_details.sql

with raw_booking_details as (
    select
        booking_id,
        customer_id,
        destination_type,
        booking_date,
        amount_spent,
        currency_code,
        status,
        segment_id,
        country_code
    from 
        {{ source('travel_project', 'booking_details') }}
)

select * from raw_booking_details
