-- 2. Dodaj firmę Kogucik Sp z o.o. w Gdyni do tabeli firmy, adres podaj dowolny

INSERT INTO firmy(nazwa_skr, id_miasta, nazwa, kod_pocztowy, ulica)
VALUES ( 'KOG', (SELECT id_miasta from miasta where nazwa = 'Gdańsk' LIMIT 1), 'Kogucik Sp z o.o.', '80-209', '10 Lutego' );