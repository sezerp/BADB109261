-- Pokaż wszystkie miasta i ich województwa używając klauzuli WHERE
select
       nazwa,
       (select wojewodztwo from wojewodztwa where miasta.kod_w = wojewodztwa.kod_w) as nazwa_wojewodztwa
from miasta;
-- Pokaż wszystkie miasta i ich województwa używając klauzuli NATURAL JOIN
select * from miasta natural join wojewodztwa;
-- Pokaż wszystkie miasta i ich województwa używając klauzuli JOIN (to jest inaczej to samo co INNER JOIN)
select * from miasta join wojewodztwa;
-- Popraw poprzednie zapytanie operatorem ON tak, aby dawało taki efekt jak NATURAL JOIN
select * from miasta m join wojewodztwa w on w.kod_w = m.kod_w;
-- Pokaż wszystkie miasta i ich województwa używając klauzuli INNER JOIN
select * from miasta m inner join wojewodztwa w on w.kod_w = m.kod_w;
-- Pokaż wszystkie miasta i ich województwa używając klauzuli LEFT OUTER JOIN
select * from miasta m left outer join wojewodztwa w on w.kod_w = m.kod_w;
-- Pokaż wszystkie miasta i ich województwa używając klauzuli RIGHT OUTER JOIN
select * from miasta m right outer join wojewodztwa w on w.kod_w = m.kod_w;
-- Pokaż imię, nazwisko, miasto I województwo z tabel: osoby, miasta  i województwa łącząc tabele klauzulą WHERE
select
    imie,
    nazwisko,
    (select nazwa from miasta m where  m.id_miasta = o.id_miasta) as miasto,
    (select wojewodztwo from wojewodztwa where (select miasta.kod_w from miasta where o.id_miasta=miasta.id_miasta ) = wojewodztwa.kod_w) as wojewodztwo
from osoby o;
-- Pokaż imię, nazwisko, miasto I województwo z tabel: osoby, miasta  i województwa łącząc tabele poprzez NATURAL JOIN
select imie, nazwisko, m.nazwa as miasto, w.wojewodztwo as wojewodztwo
    from osoby o
        natural join miasta m
        natural join wojewodztwa w;
-- Pokaż imię, nazwisko, miasto I województwo z tabel: osoby, miasta  i województwa łacząc tabele klauzulą INNER JOIN (bez operatora ON)
select imie, nazwisko, m.nazwa as miasto, w.wojewodztwo as wojewodztwo
from osoby o
         inner join miasta m
         inner join wojewodztwa w;
-- Pokaż imię, nazwisko, miasto I województwo z tabel:  osoby, miasta  i województwa łacząc tabele klauzulą INNER JOIN i używając odpowiednio operatora ON
select imie, nazwisko, m.nazwa as miasto, w.wojewodztwo as wojewodztwo
from osoby o
         inner join miasta m on m.id_miasta = o.id_miasta
         inner join wojewodztwa w on m.kod_w = w.kod_w;
-- Pokaż imię, nazwisko, miasto I województwo z tabel: osoby, miasta  i województwa łacząc tabele miasta I województwa klauzulą LEFT OUTER JOIN
select imie, nazwisko, m.nazwa as miasto, w.wojewodztwo as wojewodztwo
from osoby o
         left outer join miasta m on m.id_miasta = o.id_miasta
         left outer join wojewodztwa w on m.kod_w = w.kod_w;
-- Pokaż imię, nazwisko, miasto I województwo z tabel: osoby, miasta  i województwa łacząc tabele miasta I województwa klauzulą RIGHT OUTER JOIN
select imie, nazwisko, m.nazwa as miasto, w.wojewodztwo as wojewodztwo
from osoby o
         right outer join miasta m on m.id_miasta = o.id_miasta
         right outer join wojewodztwa w on m.kod_w = w.kod_w;
-- Pokaż listę miast, które pojawiają się w tabeli osoby I tabeli firmy. Połącz je ze sobą używając operatora UNION
select m.nazwa as miasto from osoby o join miasta m on o.id_miasta = m.id_miasta
union
select m.nazwa as miasto from firmy f join miasta m on m.id_miasta = f.id_miasta;
-- Pokaż listę miast, które pojawiają się w tabeli osoby I tabeli firmy. Połącz je ze sobą używając operatora UNION ALL
select m.nazwa as miasto from osoby o join miasta m on o.id_miasta = m.id_miasta
union all
select m.nazwa as miasto from firmy f join miasta m on m.id_miasta = f.id_miasta;