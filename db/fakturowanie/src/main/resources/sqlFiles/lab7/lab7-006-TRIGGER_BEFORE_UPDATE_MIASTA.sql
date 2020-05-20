CREATE OR REPLACE TRIGGER upd_before_miasta_log BEFORE UPDATE ON miasta FOR EACH ROW
INSERT logi(
           operacja,
           czas
       )
VALUES(
          'Próba modyfikacji rekordu w tabeli miasta',
          CURRENT_TIMESTAMP
      );
