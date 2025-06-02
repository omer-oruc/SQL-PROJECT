create database cinema_salonu;

use cinema_salonu;

create table yonetmenlertablosu (
Yonetmen_id int auto_increment primary key,
ad varchar(50) not null,
soyad varchar(50) not null
);
INSERT INTO yonetmenlertablosu  (yonetmen_id, ad, soyad) values ( 59, 'Frank' , 'Darabont'),
(62, 'David' , 'Fincher'),
(61, 'Peter' ,'Jackson' ),
(70, 'Christopher ' ,'Nolan'),
(42, 'Martin ' ,'Scorsese' ),
(71 , 'Francis', ' Lawrence'),
(54,'Amy ', 'Heckerling'),
(44 , 'Peter', 'Weir'),
(75 ,'Christopher', 'Landon'),
(35,'Çağan', 'Irmak');

create table filmlertablosu (
Film_id int auto_increment primary key,
film_ad varchar(50) not null,
süre int not null,
Yonetmen_id int not null,
foreign key(Yonetmen_id) references Yonetmenlertablosu(Yonetmen_id)
);

INSERT INTO filmlertablosu (Film_id,film_ad,süre,Yonetmen_id) values 
(01 ,'Esaretin bedeli', 142, 59),
(02, ' Dövüş Kulübü', 139, 62),
(03, 'Yüzüklerin efendisi',  178 , 61),
(04, 'Başlangıç' , 148  , 70),
(05, 'Zindan Adası' , 138 , 42),
(06, 'Ben Efsaneyim' ,  101 , 71),
(07, 'Fırlama Kızlar' , 97, 54),
(08 , 'Truman Show' , 103, 44),
(09, 'Ölüm Günün Kutlu Olsun' , 96, 75),
(10, 'Unutursam Fısılda' , 118 , 35);


create table Oyunculartablosu (
OyuncuID int auto_increment primary key,
ad varchar(50) not null,
soyad varchar(50) not null,
dogum_tarihi date not null
); 

INSERT INTO oyunculartablosu (oyuncuID, ad,soyad,dogum_tarihi) values  
(86, 'Morgan ' ,'Freeman', '1937-06-01'),
( 60,'Brad', 'pitt',  '1963-12-18'),
(42, 'Elijah', ' Wood' , '1981-01-28'),
( 49 ,'Leonardo ' ,'DiCaprio', '1974-11-11'),
(56, 'Mark' ,'Ruffalo' , '1967-11-22'),
(55, 'Will', 'Smith', '1986-10-25'),
(47 ,'Alicia','Silverstone' , '1976-10-04'),
( 61, ' jim', 'carrey' , '1962-01-17'),
(36, ' Jessica', 'Rothe' ,'1987-06-28'),
( 34, 'Farah Zeynep', 'Abdullah','1989-08-17'); 

create table FilmOyunculartablosu (
FilmOyuncu_id int auto_increment primary key,
Film_id int not null,
OyuncuID int not null,
foreign key(Film_id) references filmlertablosu(Film_id),
foreign key(OyuncuID) references oyunculartablosu(OyuncuID)
);

INSERT INTO filmoyunculartablosu (FilmOyuncu_id,Film_id,oyuncuID) values (71,01,86),
(72,02,60),
(73,03 ,42),
(74,04,49),
(75,05,56),
(76,06,55),
(77,07,47),
(78,08,61),
(79,09,36),
(80,10,34);

create table Salonlartablosu (
Salon_id int auto_increment primary key,
SalonAd varchar(50) not null,
Koltuksayısı int not null
);

INSERT INTO salonlartablosu (Salon_id,SalonAd,Koltuksayısı) values ( 001, 011, 85),
(002,012,80),
(003,013,90),
(004,014,95),
(005,015,100);

create table Seanslartablosu (
Seans_id int auto_increment primary key,
Film_id int not null,
Salon_id int not null,
Tarih date not null,
Saat time not null,
foreign key(Film_id) references filmlertablosu(Film_id),
foreign key(Salon_id) references Salonlartablosu(Salon_id)
);

INSERT INTO seanslartablosu (Seans_id,Film_id,Salon_id,Tarih,Saat) values 
(091,01,004,'2023-11-11' ,14.00),
(092,01,001,'2023-11-11',17.00),
(093,04,002,'2023-11-11',10.00),
(094,04,003,'2023-11-11',13.00),
(095,07,005,'2023-11-11',16.00);

create table Müsterilertablosu (
Müsteri_id int auto_increment primary key,
ad varchar(50) not null,
soyad varchar(50) not null,
eposta varchar(100) not null,
Telefon varchar(50) not null
);

INSERT INTO müsterilertablosu (Müsteri_id,ad,soyad,eposta,Telefon) values 
(21, 'Esma','Ay', 'esmaay@gmail.com','05123456789'),
(20,'Zeynep','Zan','zeynepzan@gmail.com','05123456788'),
(22,'Ali','Yıldız','aliyıldız@gmail.com','05123456677'),
(23,'Yavuz','Cam','yavuzcam@gmail.com','05123456777'),
(24,'Emre','göl','emregöl@gmail.com','05123456785');


create table Biletlertablosu (
Bilet_id int auto_increment primary key,
Seans_id int not null,
Müsteri_id int not null,
fiyat decimal(10,2) not null,
satistarihi date not null,
foreign key(Seans_id) references Seanslartablosu(Seans_id),
foreign key(Müsteri_id) references Müsterilertablosu(Müsteri_id)
);

INSERT INTO Biletlertablosu (Bilet_id, Seans_id, Müsteri_id, fiyat, satistarihi) VALUES 
(301, 091, 21, '120', '2023-10-11'),
(302, 092, 23, '105', '2023-10-11'),
(303, 094, 22, '95', '2023-10-11'),
(304, 093, 20, '140', '2023-10-11'),
(305, 095, 24, '135', '2023-11-11');

 create table OdemeBilgileri (
 Odeme_id int auto_increment primary key,
 Müsteri_id int not null,
 Kartnumarası varchar(16) not null,
 Sonkullanmatarihi varchar(5) not null,
 foreign key(Müsteri_id) references Müsterilertablosu(Müsteri_id)
 );
 
INSERT INTO odemebilgileri (Odeme_id,Müsteri_id,Kartnumarası,Sonkullanmatarihi) values 
(073,21,'1234567891011121', '11/28'),
(074,20,'1234567891011128', '11/28'),
(075,22,'1234567891011126', '12/28'),
(076,23,'1234567891011127', '12/28'),
(077,24,'1234567891011129', '12/28');

create table Rezervasyontablosu (
Rezervasyon_id int auto_increment primary key,
Seans_id int not null,
Müsteri_id int not null,
Rezervasyontarihi date not null,
foreign key(Seans_id) references Seanslartablosu(Seans_id),
foreign key(Müsteri_id) references Müsterilertablosu(Müsteri_id)
);

 INSERT INTO rezervasyontablosu (Rezervasyon_id,Seans_id,Müsteri_id,Rezervasyontarihi) values 
(041,091,21,'2023-11-11'),
(042,092,24,'2023-11-11'),
(043,093,22,'2023-11-11'),
(044,094,20,'2023-11-11'),
(045,095,23,'2023-11-11');

 create table Filmincelemetablosu (
 İnceleme_id int auto_increment primary key,
 Film_id int not null,
 müsteri_id int not null,
 inceleme text not null,
 puan int not null,
 foreign key (Film_id) references filmlertablosu(Film_id),
 foreign key (müsteri_id) references Müsterilertablosu(Müsteri_id)
 );
 
 INSERT INTO filmincelemetablosu (Inceleme_id,Film_id,müsteri_id,inceleme,puan) values
(061, 01 ,21, 'sorgulatıcı ' ,9),
(062, 04 , 20 , ' başarılı ' ,10),
(063, 04, 22,  ' güzel ', 10),
(064, 01 ,23, ' üzücü ', 10),
(065, 07, 24, ' eğlenceli ',9);
 

