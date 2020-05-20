CREATE OR REPLACE TRIGGER upd_after_miasta_log AFTER UPDATE ON miasta FOR EACH ROW
INSERT logi(
           operacja,
           czas
       )
VALUES(
          'Zmodyfikowano rekord w tabeli miasta',
          CURRENT_TIMESTAMP
      );
