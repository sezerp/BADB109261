-- 10. Utwórz indeks na tabeli miasta (pole: nazwa)
-- 11. Utwórz indeks na tabeli etaty (pole: stanowisko)
-- 12. Utwórz indeks na tabeli osoby (pola: nazwisko i imie)

CREATE INDEX nazwa ON miasta (nazwa);
CREATE INDEX stanowisko ON etaty (stanowisko);
CREATE INDEX search_idx ON osoby (imie, nazwisko);