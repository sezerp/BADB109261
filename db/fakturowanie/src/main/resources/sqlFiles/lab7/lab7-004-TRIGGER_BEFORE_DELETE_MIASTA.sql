CREATE OR REPLACE TRIGGER del_before_miasta_log BEFORE DELETE ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Próba usunięcia rekordu do tabeli miasta',
        CURRENT_TIMESTAMP
    );