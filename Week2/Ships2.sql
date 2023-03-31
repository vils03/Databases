USE ships;

/*Напишете заявка, която извежда името на корабите с водоизместимост над
50000.*/
SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement > 50000;

/*Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
всички кораби, участвали в битката при Guadalcanal.*/
SELECT name, displacement, numguns
FROM (outcomes JOIN ships ON ship=name ) JOIN classes ON ships.class = classes.class
WHERE battle = 'Guadalcanal';

/**/

