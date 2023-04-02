USE Ships;

/*Напишете заявка, която извежда цялата налична информация за всеки
кораб, включително и данните за неговия клас. В резултата не трябва да
се включват тези класове, които нямат кораби.*/
SELECT *
FROM ships s LEFT JOIN classes c ON s.class = c.class
WHERE NOT s.name IS NULL; --or name IS NOT NULL;

/*Повторете горната заявка, като този път включите в резултата и
класовете, които нямат кораби, но съществуват кораби със същото име
като тяхното.*/
SELECT *
FROM ships RIGHT JOIN classes ON ships.class=classes.class
WHERE classes.class IN (SELECT name FROM ships)
ORDER BY ships.name;								
									   
/*За всяка страна изведете имената на корабите, които никога не са
участвали в битка*/
SELECT country, name
FROM (classes JOIN ships ON classes.class = ships.class) LEFT JOIN outcomes ON name= ship
WHERE ship IS NULL
ORDER BY country;

/*Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода
през 1916, но наречете резултатната колона Ship Name.*/
SELECT name AS 'Ship Name'
FROM ships JOIN classes ON ships.class = classes.class
WHERE numguns >= 7 AND launched=1916;

/*Изведете имената на всички потънали в битка кораби, името и дата на
провеждане на битките, в които те са потънали. Подредете резултата по
име на битката.*/
SELECT ship, name, date
FROM outcomes JOIN battles ON battle = name
WHERE result = 'sunk'
ORDER BY name;

/*Намерете името, водоизместимостта и годината на пускане на вода на
всички кораби, които имат същото име като техния клас.*/
SELECT name, displacement, launched
FROM classes JOIN ships ON classes.class = ships.class
WHERE classes.class = name;

/*Намерете всички класове кораби, от които няма пуснат на вода нито един
кораб.*/
SELECT *
FROM classes LEFT JOIN ships ON classes.class = ships.class
WHERE launched IS NULL;

/*Изведете името, водоизместимостта и броя оръдия на корабите,
участвали в битката ‘North Atlantic’, а също и резултата от битката.*/
SELECT name, displacement, numguns, result
FROM (classes JOIN ships ON classes.class = ships.class) JOIN outcomes ON ships.name = ship
WHERE battle = 'North Atlantic';
