CREATE TABLE pozycje
(
    id_p int(6) AUTO_INCREMENT not null,
        PRIMARY KEY (id_p),
    id_f int(6),
        foreign key (id_f) references faktury(id_f),
    id_a int(6),
        foreign key (id_a) references asortyment(id_a),
    ilosc decimal(5,2)
);
