Create table public.data_product
( 
	id text,	
	product_id text,
	created_at text,
	sold_at text,
	costs numeric,
	product_category text,
	product_name text,
	product_brand text,
	product_retail_price numeric,
	product_department text,
	product_sku text,
	product_distribution_center_id text
);



select *
from data_product
limit 20;

--Average net profit cluster per product category
select product_category, sum(product_retail_price-costs)/count(distinct id) as avg_net_profit
from data_product
where sold_at is not null
and date(sold_at) < date('2022-06-01')
group by 1
order by 1