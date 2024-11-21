{% snapshot int_customer_details_snapshot %}
  {{
    config(
      target_schema='snapshots',
      target_database='TRAVEL_DB',  
      unique_key='customer_id',  
      strategy='timestamp', 
      updated_at='updated_at'  
    )
  }}

  select
     customer_id,
     first_name,
     last_name,
     email,
     phone_number,
     address,
     segment_id,
     customer_segment_name,
     country_name,
     CURRENT_TIMESTAMP AS updated_at 
  from {{ ref('int_customer_details') }}
{% endsnapshot %}
