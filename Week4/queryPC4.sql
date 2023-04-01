USE Pc;

/*Напишете заявка, която извежда производител, модел и тип на продукт
за тези производители, за които съответният продукт не се продава
(няма го в таблиците PC, Laptop или Printer).*/
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN laptop l ON p.model = l.model
WHERE l.model IS NULL
INTERSECT
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN pc l ON p.model = l.model
WHERE l.model IS NULL
INTERSECT
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN printer l ON p.model = l.model
WHERE l.model IS NULL;

--Вариант2
SELECT maker, product.model, product.type
FROM product
WHERE product.type = 'Printer' AND product.model NOT IN (SELECT model FROM printer)
UNION 
SELECT maker, product.model, product.type
FROM product
WHERE product.type = 'PC' AND product.model NOT IN (SELECT model FROM pc)
UNION 
SELECT maker, product.model, product.type
FROM product
WHERE product.type = 'Laptop' AND product.model NOT IN (SELECT model FROM laptop);

/*. Íàìåðåòå âñè÷êè ïðîèçâîäèòåëè, êîèòî ïðàâÿò êàêòî ëàïòîïè, òàêà è
ïðèíòåðè.*/
SELECT DISTINCT p.maker
FROM (product p JOIN printer pr ON p.model = pr.model) JOIN 
	  (product r JOIN laptop t ON r.model = t.model) ON p.maker = r.maker;

/*Íàìåðåòå ðàçìåðèòå íà òåçè òâúðäè äèñêîâå, êîèòî ñå ïîÿâÿâàò â äâà
èëè ïîâå÷å ìîäåëà ëàïòîïè.*/
SELECT DISTINCT l1.hd
FROM laptop l1 JOIN laptop l2 ON l1.hd = l2.hd AND l1.model != l2.model;

/*. Íàìåðåòå âñè÷êè ìîäåëè ïåðñîíàëíè êîìïþòðè, êîèòî íÿìàò ðåãèñòðèðàí
ïðîèçâîäèòåë.*/
SELECT p.model
FROM pc p LEFT JOIN product pr ON p.model = pr.model
WHERE pr.maker IS NULL;
