-- 1. Dodaj nową miejscowość w tabeli miasta. Powinna nazywać się Gdynia i znajdować się w województwie pomorskim
-- src/main/resources/sqlFiles/lab3/lab3-001-insert-into-miasta.sql


-- 2. Dodaj firmę Kogucik Sp z o.o. w Gdyni do tabeli firmy, adres podaj dowolny
-- src/main/resources/sqlFiles/lab3/lab3-002-insert-into-firmy.sql


-- 3. Dodaj 5 dowolnych osób do tabeli osoby, które mieszkają w Gdyni
-- src/main/resources/sqlFiles/lab3/lab3-003-insert-data-to-osoby.sql


-- 4. W tabeli etaty wpisz datę zatrudnienia tychże osób od dzisiejszego dnia, na stanowisku pracownik wsparcia w firmie Kogucik w Gdyni z pensją 3000 zł
-- src/main/resources/sqlFiles/lab3/lab3-004-update-osoby.sql


-- 5. Tabelę osoby zmodyfikuj tak, aby pojawiło się dodatkowe pole: data_urodzenia.
-- src/main/resources/sqlFiles/lab3/lab3-005-add-column-to-osoby.sql

-- 6. Nadaj wszystkim możliwym osobom w tabeli osoby wartość daty urodzenia jako 31.12.1999 roku
-- src/main/resources/sqlFiles/lab3/lab3-005-add-column-to-osoby.sql

-- 7. W tabeli firmy dodaj pola numer_budynku i numer_lokalu
-- src/main/resources/sqlFiles/lab3/lab3-006-add-numer_budynku_column-to-firmy.sql


-- 8.W tabeli osoby dodaj pole imie2, powinno znaleźć się przed nazwiskiem
-- src/main/resources/sqlFiles/lab3/lab3-007-modify-imie2-on-osoby.sql


-- 9. Utwórz indeks na tabeli województwa (pole: wojewodztwo)


-- 10. Utwórz indeks na tabeli miasta (pole: nazwa)
-- src/main/resources/sqlFiles/lab3/lab3-008-add-indexes.sql


-- 11. Utwórz indeks na tabeli etaty (pole: stanowisko)
-- src/main/resources/sqlFiles/lab3/lab3-008-add-indexes.sql


-- 12. Utwórz indeks na tabeli osoby (pola: nazwisko i imie)
-- src/main/resources/sqlFiles/lab3/lab3-008-add-indexes.sql


-- 13. Wyświetl zawartość tabeli (tylko imię, imię2, nazwisko i data_urodzenia) osoby alfabetycznie
-- wg nazwiska i imienia
SELECT imie, imie2, nazwisko, data_urodzenia from osoby ORDER BY nazwisko, imie ASC;

-- 14. Wynik polecenia 13 poszerz o wyświetlenie kolumny stanowisko z tabeli etaty
-- (Użyj koniecznie klauzuli WHERE, zamiast JOIN, pamiętaj o skojarzeniu kluczy)
SELECT imie, imie2, nazwisko, data_urodzenia, (SELECT stanowisko FROM etaty WHERE id_osoby = osoby.id_osoby LIMIT 1) as stanowisko
FROM osoby
ORDER BY nazwisko, imie ASC;

SELECT
    (SELECT imie FROM osoby where id_osoby = etaty.id_osoby) as imie,
    (SELECT imie2 FROM osoby where id_osoby = etaty.id_osoby) as imie2,
    (SELECT nazwisko FROM osoby where id_osoby = etaty.id_osoby) as nazwisko,
    (SELECT data_urodzenia FROM osoby where id_osoby = etaty.id_osoby) as data_urodzenia,
    stanowisko
FROM etaty ORDER BY nazwisko, imie ASC;

-- 15. Korzystając z tabel firmy, miasta i wojewodztwa wyświetl nazwy wszystkich firm,
-- miasta ich siedziby i wojewodztwa (Użyj koniecznie klauzuli WHERE, zamiast JOIN i pamiętaj o skojarzeniu kluczy)

SELECT  nazwa,
        (SELECT nazwa FROM miasta WHERE id_miasta = firmy.id_miasta) as miasto,
        (SELECT wojewodztwo FROM wojewodztwa
            WHERE kod_w = (SELECT miasta.kod_w FROM miasta
                WHERE id_miasta = firmy.id_miasta)
        ) as wojewudztwo
FROM firmy;