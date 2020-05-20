CREATE TABLE asortyment
(
    id_a int(6) AUTO_INCREMENT not null,
        PRIMARY KEY (id_a),
    produkt VARCHAR(30),
    jm VARCHAR(4),
    cena decimal(8,2),
    vat decimal(5,3)
);
