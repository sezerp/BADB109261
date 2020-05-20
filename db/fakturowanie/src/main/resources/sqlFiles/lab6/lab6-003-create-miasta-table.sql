CREATE TABLE miasta
(kod_pocztowy VARCHAR(6) not null, primary key(kod_pocztowy),
 kod_w char(3) not null,
 foreign key (kod_w) references wojewodztwa(kod_w),
 miasto varchar(30) not null
);