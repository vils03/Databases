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

/*Напишете заявка, която извежда имената на тези държави, които имат както
бойни кораби, така и бойни крайцери*/
SELECT DISTINCT c1.country
FROM classes c1, classes c2
WHERE c1.country = c2.country AND ((c1.type ='bb' AND c2.type ='bc') OR(c1.type ='bc' AND c2.type ='bb'));

/*. Напишете заявка, която извежда имената на тези кораби, които са били
повредени в една битка, но по-късно са участвали в друга битка.*/
SELECT o1.ship
FROM outcomes o1, outcomes o2, battles b1,  battles b2
WHERE o1.battle = b1.name AND o2.battle = b2.name AND o1.result = 'damaged' AND b1.date<b2.date AND o1.ship = o2.ship;
