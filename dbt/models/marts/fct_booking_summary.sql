

with booking_summary as (
    select
        b.destination_type,  -- Dimension: Destination Type
        b.destination_type_description,
        b.country_name,  -- Dimension: Country
        round(sum(b.amount_spent_usd),2) as total_amount_spent,  -- Measure
        count(distinct b.booking_id) as total_bookings  -- Measure
    from 
        {{ ref('int_booking_details') }} b
    group by 
        b.destination_type,
        b.destination_type_description,
        b.country_name
    order by 
      total_amount_spent desc
        
)

select * from booking_summary


