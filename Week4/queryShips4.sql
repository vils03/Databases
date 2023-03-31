USE Ships;

/*Напишете заявка, която извежда цялата налична информация за всеки
кораб, включително и данните за неговия клас. В резултата не трябва да
се включват тези класове, които нямат кораби.*/
SELECT *
FROM ships s LEFT JOIN classes c ON s.class = c.class
WHERE NOT s.name IS NULL;

/*Повторете горната заявка, като този път включите в резултата и
класовете, които нямат кораби, но съществуват кораби със същото име
като тяхното.*/
SELECT *
FROM ships s LEFT JOIN classes c ON s.class = c.class
WHERE NOT s.name IS NULL OR c.class IN (SELECT name
									    FROM ships); 
									   
/*За всяка страна изведете имената на корабите, които никога не са
участвали в битка*/
