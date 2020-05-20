-- 8.W tabeli osoby dodaj pole imie2, powinno znaleźć się przed nazwiskiem

ALTER TABLE osoby MODIFY imie2 VARCHAR(20) AFTER imie;