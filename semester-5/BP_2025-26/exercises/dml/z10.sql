-- with cte as (
--     select g.id_mesto from poseta p
--     join grad g on g.id_mesto = p.id_mesto
--     group by g.id_mesto
--     order by count(*) desc limit 1
-- )

-- select m.ime as ime from cte t
-- join objekt o on o.id_grad = t.id_mesto
-- join mesto m on m.id = o.id_mesto
-- order by adresa desc;

with poseti_grad as (
    select g.id_mesto as id_mesto, count(*) as broj
    from poseta p
    join grad g on g.id_mesto = p.id_mesto
    group by g.id_mesto
)

select m.ime as ime from poseti_grad t
join objekt o on o.id_grad = t.id_mesto
join mesto m on m.id = o.id_mesto
where t.broj = (select max(broj) from poseti_grad)
order by adresa desc;
