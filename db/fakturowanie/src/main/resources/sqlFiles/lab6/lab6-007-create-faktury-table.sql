CREATE TABLE faktury
(
    id_f int(6) AUTO_INCREMENT not null,
        PRIMARY KEY (id_f),
    numer varchar(14) not null,
    data_wystawienia datetime not null,
    data_sprzedazy datetime not null,
    data_platnosci datetime null,
    id_k int,
        foreign key (id_k) references kontrahenci(id_k)
);