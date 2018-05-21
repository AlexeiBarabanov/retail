---2. Показать самых лучших клиентов (принесших большую прибыль)

select organization.name, sum(payment.amount) as sum
  from payment
    join contract on payment.contract_id = contract.contract_id
    join organization on contract.organization_id = organization.organization_id
group by organization.organization_id order by sum desc