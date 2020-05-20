-- 3. Dodaj 5 dowolnych osób do tabeli osoby, które mieszkają w Gdyni

SET @id_miasta = (SELECT id_miasta from miasta where nazwa = 'Gdańsk' LIMIT 1);

INSERT INTO
    osoby(id_miasta, imie, imie2, nazwisko)
values(@id_miasta, 'Ilona', 'Katarzyna', 'Szwed');

INSERT INTO
    osoby(id_miasta, imie, imie2, nazwisko)
values(@id_miasta, 'Katarzyna', 'Anna', 'Kita');

INSERT INTO
    osoby(id_miasta, imie, imie2, nazwisko)
values(@id_miasta, 'Michał', 'Robert', 'Kuranowski');

INSERT INTO
    osoby(id_miasta, imie, imie2, nazwisko)
values(@id_miasta, 'Judasz', null, 'Iskariota');

INSERT INTO
    osoby(id_miasta, imie, imie2, nazwisko)
values(@id_miasta, 'Bill', 'Mesjasz', 'Gates');