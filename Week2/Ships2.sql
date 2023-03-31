USE ships;

/*Напишете заявка, която извежда името на корабите с водоизместимост над
50000.*/
SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement > 50000;


