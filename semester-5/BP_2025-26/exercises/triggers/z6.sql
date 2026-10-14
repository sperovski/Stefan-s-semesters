-- create trigger trg_broj_poseti
-- before insert on Poseta
-- for each row
-- when (
--     select count(*)
--     from Poseta p
--     where p.id_mesto = new.id_mesto 
--     and p.kor_ime = new.kor_ime
-- ) = 0 
-- begin
--     update Korisnik
--     set broj_poseti = broj_poseti + 1
--     where kor_ime = new.kor_ime;
-- end


-- create trigger trg_broj_poseti
-- after insert on Poseta
-- for each row
-- when (
--     select count(*)
--     from Poseta p
--     where p.id_mesto = new.id_mesto 
--     and p.kor_ime = new.kor_ime
-- ) = 1 
-- begin
--     update Korisnik
--     set broj_poseti = broj_poseti + 1
--     where kor_ime = new.kor_ime;
-- end;


create trigger trg_broj_poseti
after insert on Poseta
for each row
begin
    update Korisnik
    set broj_poseti = (select count(distinct id_mesto) from Poseta p where p.kor_ime = new.kor_ime)
    where kor_ime = new.kor_ime;
end;




