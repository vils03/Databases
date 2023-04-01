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
ORDER BY ships.name;								    FROM ships); 
									   
/*За всяка страна изведете имената на корабите, които никога не са
участвали в битка*/
SELECT country, name
FROM (classes JOIN ships ON classes.class = ships.class) LEFT JOIN outcomes ON name= ship
WHERE ship IS NULL
ORDER BY country;
