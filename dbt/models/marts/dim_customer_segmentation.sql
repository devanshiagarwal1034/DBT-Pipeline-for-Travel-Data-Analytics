
with customer_segmentation as (
    select
        c.customer_segment_name,  -- Dimension: Customer Segment
        c.country_name,  -- Dimension: Country
        count(distinct c.customer_id) as total_customers  -- Measure (optional in DIM)
    from 
        {{ ref('int_customer_details') }} c
    group by 
        c.customer_segment_name,
        c.country_name
    order by 
        c.customer_segment_name,
        c.country_name
       
)

select * from customer_segmentation
