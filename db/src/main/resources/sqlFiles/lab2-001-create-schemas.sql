ALTER SCHEMA baza_danych CHARACTER SET utf8 COLLATE utf8_polish_ci;

CREATE TABLE wojewodztwa
(kod_w	char(3) not null,
 PRIMARY KEY (kod_w),
 wojewodztwo varchar(30) not null
);


CREATE TABLE miasta
(id_miasta 	int not null AUTO_INCREMENT, primary key(id_miasta),
 kod_w char(3) not null,
 foreign key (kod_w) references wojewodztwa(kod_w),
 nazwa 		varchar(30) not null
);

CREATE TABLE osoby
(	id_osoby	int 		not null AUTO_INCREMENT,
     primary key (id_osoby),
     id_miasta	int 		not null,
     foreign key (id_miasta) references miasta(id_miasta),
     imie		varchar(20) 	not null,
     nazwisko	varchar(30) 	not null
);



CREATE TABLE firmy
(	nazwa_skr	char(4) 	not null
    ,	primary key (nazwa_skr)
    ,	id_miasta	int 		not null
    ,	foreign key (id_miasta) references miasta(id_miasta)
    ,	nazwa		varchar(60) 	not null
    ,	kod_pocztowy	char(6)		not null
    ,	ulica		varchar(60)	not null
);


CREATE TABLE etaty
(	id_osoby 	int 		not null
    ,	foreign key  (id_osoby)	references osoby(id_osoby)
    ,	id_firmy 	char(4) 	not null
    ,	foreign key (id_firmy) references firmy(nazwa_skr)
    ,	stanowisko	varchar(60)	not null
    ,	pensja 		decimal(10,4) 		not null
    ,	od 		datetime 	not null
    ,	do 		datetime 	null
    ,	id_etatu 	int 		not null AUTO_INCREMENT
    ,	primary key (id_etatu)
);

CREATE TABLE CECHY
(id_CECHY	int 		NOT NULL AUTO_INCREMENT
    ,	PRIMARY KEY (id_CECHY)
    ,	Opis_cechy	varchar(60)	NOT NULL
    ,	jednowybieralna	bit		NOT NULL	DEFAULT 0
);



CREATE TABLE WARTOSCI_CECH
(	id_wartosci	int		NOT NULL	AUTO_INCREMENT
    ,	PRIMARY KEY (id_wartosci)
    ,	id_CECHY	int 		NOT NULL
    ,	FOREIGN KEY (id_CECHY) REFERENCES CECHY(ID_CECHY)
    ,	Opis_wartosci	varchar(40)	NOT NULL
);



CREATE TABLE FIRMY_CECHY
(	id_wartosci	int		NOT NULL
    ,	FOREIGN KEY (id_wartosci) REFERENCES WARTOSCI_CECH(ID_WARTOSCI)
    ,	id_firmy	char(4)		NOT NULL
    ,	PRIMARY KEY (id_wartosci,id_firmy)
);
