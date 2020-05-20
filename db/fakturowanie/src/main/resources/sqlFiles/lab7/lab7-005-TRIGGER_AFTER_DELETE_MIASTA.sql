CREATE OR REPLACE TRIGGER del_after_miasta_log AFTER DELETE ON miasta FOR EACH ROW
INSERT logi(
           operacja,
           czas
       )
VALUES(
          'Usunięto rekord z tabeli miasta',
          CURRENT_TIMESTAMP
      );