-- select m.ime
-- from mesto m
-- where m.id = (
--     select o.id_grad
--     from poseta p
--     join objekt o on o.id_mesto = p.id_mesto
--     group by o.id_mesto, o.id_grad
--     order by count(*) desc
--     limit 1
-- );

with poseti_objekt as (
    select o.id_mesto as id_objekt, o.id_grad as id_grad, count(*) as broj
    from poseta p
    join objekt o on o.id_mesto = p.id_mesto
    group by o.id_mesto, o.id_grad
)

select distinct m.ime
from poseti_objekt po
join mesto m on m.id = po.id_grad
where po.broj = (select max(broj) from poseti_objekt);
