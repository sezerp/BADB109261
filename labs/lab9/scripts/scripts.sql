-- 1. Będąc zalogowanym jako root utwórz nowego użytkownika o nazwie boss z hasłem: szefu123.
CREATE USER IF NOT EXISTS 'boss'@'%' IDENTIFIED BY 'szefu123';
-- 2. Przeloguj się na roota i nadaj wszelkie możliwe uprawnienia użytkownikowi boss. Sprawdź uprawnienia zalogowany jako boss (np. sprawdź, czy boss może tworzyć nową tabelę).
GRANT ALL PRIVILEGES ON fakturowanie.* TO 'boss'@'%' WITH GRANT OPTION;
-- 3. Przeloguj się na roota i utwórz nowego użytkownika o nazwie janusz z hasłem: januszek2000. Sprawdź uprawnienia zalogowany jako janusz (wykonaj np. jakiś select).
CREATE USER IF NOT EXISTS 'janusz'@'%' IDENTIFIED BY 'januszek2000';
-- 4. Przeloguj się na roota i nadaj uprawnienia SELECT, INSERT, UPDATE użytkownikowi janusz do  tabel miasta i asortyment. Sprawdź uprawnienia zalogowany jako janusz (wykonaj np. jakiś select).
GRANT SELECT, INSERT, UPDATE ON fakturowanie.miasta TO 'janusz'@'%';
GRANT SELECT, INSERT, UPDATE ON fakturowanie.asortyment TO 'janusz'@'%';

-- 5. Pozbaw użytkownika janusz praw UPDATE do tabeli miasta.
REVOKE UPDATE ON fakturowanie.miasta FROM 'janusz'@'%';

-- 6. Pozbaw użytkownika boss wszelkich praw.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'boss'@'%';

-- 7. Usuń użytkownika boss.
DROP USER IF EXISTS boss;
