---5. Показать информацию по самым долгим, в плане доставки, направлениям

select city, address, max(date_delivery - date_shipment) from location
  join shipment on shipment.location_id = location.location_id
  group by location.location_id
order by max desc