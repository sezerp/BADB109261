-- 1.    Wyświetl wszystkie stanowiska z tabeli etaty w porządku alfabetycznym
select stanowisko from etaty order by stanowisko asc;
-- 2.    Wyświetl  wszystkie stanowiska z tabeli etaty w porządku alfabetycznym tak, aby się nie powtarzały
select distinct stanowisko from etaty order by stanowisko asc;
-- 3.    Wyświetl nazwy województw w porządku malejącym alfabetycznie (od z do a) ale powinno ich być tylko 3
select distinct wojewodztwo from wojewodztwa order by wojewodztwo desc limit 3;
-- 4.    Wyświetl wszystkie imiona i nazwiska z tabeli osoby, numerując je.
select @n := @n + 1 n, imie, nazwisko from osoby, (SELECT @n := 0) idx;
-- 5.    Wyświetl wszystkie stanowiska z tabeli etaty, numerując je. Nazwy stanowisk mogą się powtarzać
select @n := @n + 1 n, stanowisko from etaty, (SELECT @n := 0) idx;
-- 6.    Zsumuj wszystkie pensje z tabeli etaty
select sum(pensja) from etaty;
-- 7.    Oblicz średnią pensję wg danych z tabeli etaty
select avg(pensja) from etaty;
-- 8.    Oblicz najniższą pensję wg danych z tabeli etaty
select min(pensja) from etaty;
-- 9.    Oblicz najwyższą pensję wg danych z tabeli etaty
select max(pensja) from etaty;
-- 10.    Oblicz sumę pensji dla każdej z firm, posługując się ich nazwą skróconą  z tabeli firmy
select f.nazwa_skr, sum(pensja) from etaty join firmy f on etaty.id_firmy = f.nazwa_skr group by f.nazwa_skr;
-- 11.    Oblicz średnią pensję dla każdej z firm, posługując się ich nazwą skróconą  z tabeli firmy
select f.nazwa_skr, avg(pensja) from etaty join firmy f on etaty.id_firmy = f.nazwa_skr group by f.nazwa_skr;
-- 12.    Zlicz ile osób z tabeli etaty zajmuje każde ze stanowisk
select stanowisko, count(*) from etaty group by stanowisko;
-- 13.    Wyświetl te stanowiska, które są zajmowane przez więcej niż jedną osobę
select stanowisko, count(*) as cnt from etaty group by stanowisko having cnt > 1;
-- 14.    Podaj nazwy miast, które mają przypisanego jakiegokolwiek mieszkańca w tabeli osoby
select distinct nazwa as miasto from miasta m inner join osoby o on m.id_miasta = o.id_miasta ;
-- 15.    Podaj nazwy miast, które mają przypisaną jakąkolwiek firmę w tabeli firmy
select distinct m.nazwa as miasto from firmy f  inner join miasta m on f.id_miasta = m.id_miasta;
-- 16.    Podaj wykaz województw, które mają przypisane jakiekolwiek miasta i zlicz ile miast jest w każdym z województw
select w.wojewodztwo as miasto, count(*) as cnt from wojewodztwa w join miasta m on w.kod_w = m.kod_w group by wojewodztwo;
-- 17.    Zlicz ile jest województw, które nie mają żadnego przypisanego miasta w tabeli miasta
select count(distinct w.wojewodztwo) as cnt from wojewodztwa w left join miasta m on w.kod_w = m.kod_w where m.nazwa is null;
-- 18.    Podaj listę firm, które mają przypisane jakiekolwiek stanowiska i zlicz ile w każdej z firm jest stanowisk. Firmy powinny być ułożone w porządku alfabetycznym
select f.nazwa, count(e.stanowisko) from firmy f join etaty e on f.nazwa_skr = e.id_firmy group by f.nazwa order by f.nazwa asc;
-- 19.    Podaj listę firm, które mają przypisane jakiekolwiek stanowiska i zlicz ile w każdej z firm jest stanowisk. Ale chodzi tylko o te firmy, które mają więcej niż jedno stanowisko i mniej niż 5. Firmy powinny być ułożone w porządku alfabetycznym
select f.nazwa, count(e.stanowisko) as cnt from firmy f join etaty e on f.nazwa_skr = e.id_firmy group by f.nazwa having cnt between 1 and 5 order by f.nazwa asc;
