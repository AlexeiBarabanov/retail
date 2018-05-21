---1. Показать всех должников (чей товар доставлен, а сумма по договору не совпадает с суммой по платежам) по договорам с сортировкой по максимальному долгу

select name, diff from
  (select
     *,
     (contract.amount - payment.amount) as diff
   from shipment_detail
     join contract on shipment_detail.contract_id = contract.contract_id
     join (
            select shipment_id from shipment where date_delivery < current_date
          ) as delivered
       on shipment_detail.shipment_id = delivered.shipment_id
     join payment on contract.contract_id = payment.contract_id
     join organization on contract.organization_id = organization.organization_id
  ) as inners
where diff > 0
order by diff desc

