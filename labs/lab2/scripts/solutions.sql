-- 1.    Wyświetl zawartość tabeli wojewodztwa
SELECT * wojewodztwa;
-- 2.    Usuń wojewodztwo opolskie
DELETE FROM wojewudztwa where kod_w = 'opo';
-- lub
DELETE FROM wojewudztwa where wojewodztwo = 'opolskie';
-- 3.    Pokaż wojewodztwo mazowieckie
SELECT * FROM wojewudztwa WHERE kod_w = 'maz';
-- lub
SELECT * FROM wojewudztwa WHERE wojewudztwo = 'mazowieckie';
-- 4.    Pokaż wszystkie województwa na literę M (operator %)
SELECT * FROM wojewodztwa WHERE wojewodztwo LIKE 'm%';
-- 5.    Pokaż wszystkie województwa zawierające myślnik w nazwie
SELECT * FROM wojewodztwa WHERE wojewodztwo LIKE '%-%';
-- 6.    Pokaż wszystkie województwa z nazwą kończąca się na „ckie”
SELECT * FROM wojewodztwa WHERE wojewodztwo LIKE '%ckie';
-- 7.    Pokaż wszystkie województwa z nazwą na 7 liter (operator _)
-- Pod warunkiem że baza danych zawiera znaki z alfabetu łacińskiego (26 znaków) dla języka polskiego nie zadzuiała przez znaki diakrytyczne
SELECT * FROM wojewodztwa WHERE length(wojewodztwo) = 9;
-- lub
SELECT * FROM wojewodztwa WHERE wojewodztwo LIKE '_______';
-- 8.    Dodaj na nowo wiersz z województwem opolskim.
INSERT INTO wojewodztwa(kod_w, wojewodztwo) VALUES('opo', 'opolskie');
-- 9.    Wyświetl wszystkie wojewodztwa porządkując je alfabetycznie
select kod_w, wojewodztwo from wojewodztwa order by wojewodztwo asc;
-- 10.    Wyświetl zawartość tabeli miasta
select * miasta;
-- 11.    Do tabeli miast wprowadź jeszcze pięć dowolnych (poprawnych) rekordów
-- w pliku migracyjnym src/main/resources/sqlFiles/lab2/lab2-003-solutions-11.sql


-- 12.    Ponownie wyświetl zawartość tabeli miasta alfabetycznie
select * from miasta;
-- 13.     Wyświetl z jakich wojewodztw są wszystkie miasta
select kod_w from miasta;
-- 14.    Wyświetl z jakich wojewodztw są wszystkie miasta, sortując je alfabetycznie wg nazw województw w porządku rosnącym
select * from miasta order by kod_w asc;
-- 15.    Wyświetl z jakich wojewodztw są wszystkie miasta, sortując je alfabetycznie wg nazw  miast w porządku malejącym
select * from miasta order by kod_w desc;
-- 16.    Do tabeli osoby dodaj jeszcze jedną kolumnę – imie2.
-- src/main/resources/sqlFiles/lab2/lab2-004-add-imie2-to-osoby.sql


-- 17.    Zmień dane w tabeli osoby tak, aby id_o 3 i 5 zawierały dane: Jan Włodzimierz Szczęsny i Ewa Jadwiga Wyrwa
-- src/main/resources/sqlFiles/lab2/lab2-005-update-osoby-records.sql


-- 18.    Wyświetl tylko te rekordy z tabeli osoby, które nie mają pustego pola imie2
select * from osoby where imie2 is not null;
-- 19.    Dodaj 5 nowych (poprawnych) rekordów do tabeli osoby
-- src/main/resources/sqlFiles/lab2/lab2-006-insert-records-osoby.sql


-- 20.    Wyświetl tylko te rekordy z tabeli osoby, które mają id_o równe 3, 5 i 7
select * from osoby where id_osoby in (3, 5, 7);
-- 21.    Wyświetl pełne dane personalne z tabeli osoby, ale tylko kobiet (końcówka a)
select * from osoby where imie LIKE '%a';
-- 22.    Wyświetl imiona i nazwiska osób, które w imieniu lub nazwisku mają literę k
select * from osoby where imie LIKE '%k%' or nazwisko LIKE '%k%';
-- 23.    Wyświetl imiona i nazwiska osób, które w imieniu i nazwisku mają literę a
select * from osoby where imie LIKE '%a%' and nazwisko LIKE '%a%';
-- 24.    Z tabel osoby, miasta i wojewodztwa wyswietl ich całe zawartości
select * from osoby left outer join miasta
    on osoby.id_miasta = miasta.id_miasta;
-- 25.    Z tabel osoby, miasta i wojewodztwa wyświetl wszystkie pola, które nie są kluczami
select imie, imie2, nazwisko, m.nazwa as nazwa_miasta, w.wojewodztwo
    from osoby o
         join miasta m
              on o.id_miasta = m.id_miasta
         join wojewodztwa w
             on m.kod_w = w.kod_w;
-- 26.Wyświetl imiona, nazwiska, daty zatrudnienia i stanowiska osób zatrudnionych pomiędzy 1 stycznia 2000 roku a 31 grudnia 2001 roku

select imie, imie2, nazwisko, e.od, e.do, e.stanowisko
from osoby
         join etaty e on osoby.id_osoby = e.id_osoby
where e.od between  STR_TO_DATE('2000-01-01','%Y-%m-%d') AND STR_TO_DATE('2001-12-31','%Y-%m-%d');
-- lub bardziej fancy
select imie, imie2, nazwisko, e.od, e.do, e.stanowisko
from osoby
         join etaty e on osoby.id_osoby = e.id_osoby
where datediff(e.od, '2000-01-01') between 0 AND datediff('2001-12-31', '2000-01-01');
