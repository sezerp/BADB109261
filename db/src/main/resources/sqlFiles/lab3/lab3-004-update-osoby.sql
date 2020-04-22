-- 4. W tabeli etaty wpisz datę zatrudnienia tychże osób od dzisiejszego dnia,
-- na stanowisku pracownik wsparcia w firmie Kogucik w Gdyni z pensją 3000 zł

SET @id_firmy = 'KOG';

SET @id_osoby = (SELECT id_osoby FROM osoby where imie='Ilona' AND nazwisko='Szwed');
INSERT INTO etaty(id_osoby, id_firmy, stanowisko, pensja, od)
    VALUES (@id_osoby, @id_firmy, 'pracownik wsparcia', 3000.0, NOW());

SET @id_osoby = (SELECT id_osoby FROM osoby where imie='Katarzyna' AND nazwisko='Kita');
INSERT INTO etaty(id_osoby, id_firmy, stanowisko, pensja, od)
VALUES (@id_osoby, @id_firmy, 'pracownik wsparcia', 3000.0, NOW());


SET @id_osoby = (SELECT id_osoby FROM osoby where imie='Michał' AND nazwisko='Kuranowski');
INSERT INTO etaty(id_osoby, id_firmy, stanowisko, pensja, od)
VALUES (@id_osoby, @id_firmy, 'pracownik wsparcia', 3000.0, NOW());


SET @id_osoby = (SELECT id_osoby FROM osoby where imie='Judasz' AND nazwisko='Iskariota');
INSERT INTO etaty(id_osoby, id_firmy, stanowisko, pensja, od)
VALUES (@id_osoby, @id_firmy, 'pracownik wsparcia', 3000.0, NOW());

SET @id_osoby = (SELECT id_osoby FROM osoby where imie='Bill' AND nazwisko='Gates');
INSERT INTO etaty(id_osoby, id_firmy, stanowisko, pensja, od)
VALUES (@id_osoby, @id_firmy, 'pracownik wsparcia', 3000.0, NOW());