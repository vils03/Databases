/*Използвайте две INSERT заявки. Съхранете в базата данни факта, че персонален компютър
модел 1100 е направен от производителя C, има процесор 2400 MHz, RAM 2048 MB, твърд диск
500 GB, 52x оптично дисково устройство и струва $299. Нека новият компютър има код 12.
Забележка: модел и CD са от тип низ.*/

INSERT INTO PC VALUES(12,'1100', 2400, 2048, 500, '52x', 229);
INSERT INTO product VALUES('C',1100,'PC');

/*Да се изтрие наличната информация в таблицата PC за компютри модел 1100.
*/
DELETE FROM PC
WHERE model='1100';

/*Да се изтрият от таблицата Laptop всички лаптопи, направени от производител, който не
произвежда принтери..
*/
DELETE FROM laptop
WHERE laptop.model IN (SELECT model FROM product WHERE type='Laptop'
AND model NOT IN (SELECT model FROM product WHERE type='Printer'));

/*Производител А купува производител B. На всички продукти на В променете производителя да
бъде А.
*/
UPDATE product
SET maker='A'
WHERE maker='B';

/*Да се намали наполовина цената на всеки компютър и да се добавят по 20 GB към всеки твърд
диск.
*/
UPDATE pc
SET price=price/2, hd=hd+20;

/*За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.
*/
UPDATE laptop
SET screen = screen+1
WHERE model IN (SELECT model FROM product WHERE maker='B' AND type='Printer');
