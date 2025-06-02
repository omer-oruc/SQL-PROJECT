SELECT * FROM cinema_salonu.filmlertablosu;

SELECT film_ad FROM filmlertablosu WHERE süre between 100 and 140;

SELECT Müsteri_id,ad from müsterilertablosu WHERE Telefon like'%77';

SELECT Müsteri_id,ad,Telefon from müsterilertablosu WHERE Telefon like'0512345678%';

#Filmler tablosundaki tüm verilerini seçen SQL cümlesini yazınız.
SELECT*FROM cinema_salonu.filmlertablosu;

#132 ile 148 aralığındaki süresi olan filmleri listeleyen SQL cümlesini yazınız.
SELECT film_ad, süre FROM filmlertablosu WHERE süre BETWEEN 132  AND 148;

#Filmlere verilen tüm puanların genel ortalamasını gösteren SQL cümlesini yazınız.
SELECT AVG(puan) AS ortalama_puan FROM filmincelemetablosu;

#Süresi en kısa filmden en uzun olan filme kadar filmleri listeleyen SQL cümlesini yazınız.
SELECT * FROM Filmlertablosu ORDER BY süre ASC;

#Bilet fiyatlarını en pahalıdan en ucuzuna göre sıralayan SQL cümlesini yazınız.
SELECT * FROM Biletlertablosu ORDER BY fiyat DESC;

#filmleri puanlarına göre en yüksekten en düşüğüne göre listeleyen SQL cümlesini yazınız.
SELECT* FROM filmincelemetablosu  ORDER BY puan DESC;

#Adı M harfi ile başlayan oyuncuları listeleyen SQL cümlesini yazınız.
SELECT oyuncuID,ad FROM Oyunculartablosu WHERE ad LIKE 'M%';

#Müşteriler tablosunda telefon numarasının 77 ile bittiği müşterinin bilgilerini listeleyen SQL cümlesini yazınız.
SELECT Müsteri_id,ad from müsterilertablosu WHERE Telefon like'%77';

#müşteriler tablosunda telefon numarası 0512345678 olan müşterinin bilgilerini listeleyen SQL cümlesini yazınız.
SELECT Müsteri_id,ad,Telefon from müsterilertablosu WHERE Telefon like'0512345678%';

#Ortaması 9dan büyük olan filmleri listeleyen SQL cümlesini yazınız.
SELECT film_id , AVG(Puan) AS PuanOrtalamasi FROM filmincelemetablosu GROUP BY film_id HAVING AVG(Puan) > 9;

#Filmler tablosunda adı B ile başlayan filmleir listeleyn SQL cümlesini yazınız.
SELECT * FROM filmlertablosu WHERE film_ad  LIKE 'B%';

#Yönetmenler tablosunda isminde A olan yönetmenleri listeleyen SQL cümlesini yazınız.
SELECT * FROM yonetmenlertablosu WHERE ad LIKE '%A%';

#Bilet fiyatlarının toplamını bulan SQL cümlesini yazınız.
SELECT SUM(Fiyat) AS ToplamBiletFiyati FROM biletlertablosu;

#Filmler tablosundaki toplam film sayısını gösteren SQL cümlesini yazınız.
SELECT COUNT(film_id) AS ToplamFilmSayısı FROM filmlertablosu;

