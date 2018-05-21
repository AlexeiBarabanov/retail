---4. Показать самый популярный город доставки

select count(*), city from location join shipment on location.location_id = shipment.location_id
  group by city order by count desc limit 1