-- 5. Tabelę osoby zmodyfikuj tak, aby pojawiło się dodatkowe pole: data_urodzenia.

ALTER TABLE osoby
    ADD data_urodzenia DATE;

-- 6. Nadaj wszystkim możliwym osobom w tabeli osoby wartość daty urodzenia jako 31.12.1999 roku

-- UPDATE osoby
-- SET imie = 'Jan', imie2 = 'Włodzimierz', nazwisko='Szczęsny'
-- WHERE id_osoby = 3;

UPDATE osoby
    SET data_urodzenia = STR_TO_DATE('1999-12-31','%Y-%m-%d');

