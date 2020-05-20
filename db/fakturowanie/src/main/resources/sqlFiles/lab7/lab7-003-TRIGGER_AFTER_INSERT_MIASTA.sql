CREATE OR REPLACE TRIGGER ins_after_miasta_log
BEFORE INSERT  ON miasta FOR EACH ROW
INSERT logi(
    operacja,
    czas
)
VALUES(
    'Dopisano rekord do tabeli miasta',
    CURRENT_TIMESTAMP
);