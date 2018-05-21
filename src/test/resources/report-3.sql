---3. Показать самый популярный продукт доставки и количество за месяц

select product.name, count(*) from product
  join contract on product.product_id = contract.product_id
  join (
         select contract_id from shipment_detail
           join shipment on shipment_detail.shipment_id = shipment.shipment_id
         where date_delivery > current_date - interval '1 month'
       ) as shipment_detail
    on contract.contract_id = shipment_detail.contract_id
group by product.name
order by count desc limit 1