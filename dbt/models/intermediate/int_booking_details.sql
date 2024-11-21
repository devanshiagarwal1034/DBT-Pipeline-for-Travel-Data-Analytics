

{{
    config(
        materialized='incremental', 
        unique_keys = 'booking_id' ,
        incremental_strategy ='merge',
        pre_hook=[
            "insert into TRAVEL_DB.dbt_dagarwal.model_run_log (model_name, run_time, status) values ('int_booking_details', current_timestamp(), 'start')"
        ],
        post_hook=[
            "insert into TRAVEL_DB.dbt_dagarwal.model_run_log (model_name, run_time, status) values ('int_booking_details', current_timestamp(), 'success')"
        ]
         
    )

    
  }}

  


-- SQL for the model
with booking as (
    select
        b.booking_id as booking_id,
        b.customer_id,
        b.destination_type,
        d.description as destination_type_description,
        b.booking_date,
        b.amount_spent,
        b.currency_code,
        b.status,
        b.segment_id,
        s.segment_name as customer_segment_name,
        co.country_name,
        case 
            when b.currency_code = 'EUR' then b.amount_spent / coalesce(dur.exchange_rate_to_usd, 1)
            when b.currency_code = 'CAD' then b.amount_spent / coalesce(dur.exchange_rate_to_usd, 1)
            when b.currency_code = 'INR' then b.amount_spent / coalesce(dur.exchange_rate_to_usd, 1)
            else b.amount_spent 
        end as amount_spent_usd
    from 
        {{ ref('stg_booking_details') }} b
    left join 
        {{ ref('destination_types') }} d on b.destination_type = d.destination_type
    left join 
        {{ ref('customer_segments') }} s on b.segment_id = s.segment_id
    left join
        {{ ref('country_codes') }} co on b.country_code = co.country_code
    left join
        {{ ref('currency_exchange_rates') }} dur on b.currency_code = dur.currency_code
    
)


, final as (
    select * from booking 
    {% if is_incremental() %}
    where booking_date > (select max(booking_date) from {{this}})
    {% endif %}
)


select * , current_timestamp as updated_at 
from final


