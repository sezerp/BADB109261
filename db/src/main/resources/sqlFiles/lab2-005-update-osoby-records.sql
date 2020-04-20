-- 17.    Zmień dane w tabeli osoby tak, aby id_o 3 i 5 zawierały dane: Jan Włodzimierz Szczęsny i Ewa Jadwiga Wyrwa

UPDATE osoby
SET imie = 'Jan', imie2 = 'Włodzimierz', nazwisko='Szczęsny'
    WHERE id_osoby = 3;

UPDATE osoby
SET imie = 'Ewa', imie2 = 'Jadwiga', nazwisko='Wyrwa'
    WHERE id_osoby = 5;