-- 1. Utwórz nową tabelę, o nazwie logi z następującymi polami: id_log, operacja, czas
CREATE TABLE logi
(
    id_log INT NOT NULL,
    operacja VARCHAR(100) NOT NULL,
    czas TIMESTAMP NOT NULL
);
-- 2. Utwórz trigger, który przed dopisaniem rekordu do tabeli miasta wpisuje do tabeli logi operację:
-- "Próba dopisania rekordu do tabeli miasta" i wstawia do pola czas bieżący czas
CREATE OR REPLACE TRIGGER ins_before_miasta_log BEFORE INSERT  ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
              'Próba dopisania rekordu do tabeli miasta',
              CURRENT_TIMESTAMP
          );

-- 3. Utwórz trigger, który po dopisaniu rekordu do tabeli miasta wpisuje do tabeli logi operację:
-- "Dopisano rekord do tabeli miasta" i wstawia do pola czas bieżący czas
CREATE OR REPLACE TRIGGER ins_after_miasta_log AFTER INSERT  ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Dopisano rekord do tabeli miasta',
        CURRENT_TIMESTAMP
    );
-- 4. Utwórz trigger, który przed usunięciem rekordu do tabeli miasta wpisuje do tabeli logi operację:
-- "Próba usunięcia rekordu do tabeli miasta" i wstawia do pola czas bieżący czas
CREATE OR REPLACE TRIGGER del_before_miasta_log BEFORE DELETE ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Próba usunięcia rekordu do tabeli miasta',
        CURRENT_TIMESTAMP
    );

-- 5. Utwórz trigger, który po usunięciu rekordu do tabeli miasta wpisuje do tabeli logi operację:
-- "Usunięto rekord z tabeli miasta" i wstawia do pola czas bieżący czas
CREATE OR REPLACE TRIGGER del_after_miasta_log AFTER DELETE ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
              'Usunięto rekord z tabeli miasta',
              CURRENT_TIMESTAMP
          );

-- 6. Utwórz trigger, który przed modyfikacją rekordu w tabeli miasta wpisuje do tabeli logi operację:
-- "Próba modyfikacji rekordu w tabeli miasta" i wstawia do pola czas bieżący czas

CREATE OR REPLACE TRIGGER upd_before_miasta_log BEFORE UPDATE ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Próba modyfikacji rekordu w tabeli miasta',
        CURRENT_TIMESTAMP
    );

-- 7. Utwórz trigger, który po modyfikacji rekordu w  tabeli miasta wpisuje do tabeli logi operację:
-- "Zmodyfikowano rekord w tabeli miasta" i wstawia do pola czas bieżący czas

CREATE OR REPLACE TRIGGER upd_after_miasta_log AFTER UPDATE ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Zmodyfikowano rekord w tabeli miasta',
        CURRENT_TIMESTAMP
    );