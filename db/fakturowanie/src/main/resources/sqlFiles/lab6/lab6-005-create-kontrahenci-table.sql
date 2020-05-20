CREATE TABLE kontrahenci(
    id_k int AUTO_INCREMENT not null,
        PRIMARY KEY (id_k),
    nazwa VARCHAR(50) not null,
    nazwa_skr VARCHAR(30) not null,
    ulica VARCHAR(30),
    nr VARCHAR(6),
    nr2 VARCHAR(6),
    kod_pocztowy VARCHAR(6),
        foreign key (kod_pocztowy) references miasta(kod_pocztowy)
);
