-- 1. Napisz i wywołaj procedurę, która zlicza ilość wierszy w tabeli kontrahenci.
DELIMITER //

CREATE OR REPLACE PROCEDURE zlicz_kontrahentow (OUT cnt INT)
 BEGIN
SELECT COUNT(*) INTO cnt FROM kontrahenci;
END;
//

DELIMITER ;

CALL zlicz_kontrahentow(@ilosc_kontrahentow);
SELECT @ilosc_kontrahentow;

-- 2. Napisz i wywołaj procedurę, która sprawdza, która pozycja asortymentu była najczęściej kupowana i wypisuje ją z nazwy wraz z ilością.

DELIMITER //

CREATE OR REPLACE PROCEDURE najpopularniejszy_asortyment_asortyment(
    OUT name VARCHAR(30),
    OUT cnt INT)
BEGIN
    SELECT MAX(overal_orders), produkt INTO cnt, name FROM (
        SELECT SUM(ilosc) AS overal_orders, produkt FROM pozycje
        left join faktury ON
                pozycje.id_f = faktury.id_f
        left join asortyment a ON
                pozycje.id_a = a.id_a
        GROUP BY pozycje.id_p
   ) AS temp_table;
END;
//

DELIMITER ;

call najpopularniejszy_asortyment_asortyment(@nazwa_produktu, @ilosc);
SELECT @nazwa_produktu, @ilosc;