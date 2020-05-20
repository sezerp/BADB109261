CREATE OR REPLACE TRIGGER ins_before_miasta_log BEFORE INSERT  ON miasta FOR EACH ROW
    INSERT logi(
        operacja,
        czas
    )
    VALUES(
        'Próba dopisania rekordu do tabeli miasta',
        CURRENT_TIMESTAMP
      );
