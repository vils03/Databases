USE Movies;

--Напишете заявка, която извежда адреса на студио ‘Disney’
SELECT address
FROM studio
WHERE name = 'Disney';

--Напишете заявка, която извежда рождената дата на актьора Jack Nicholson
SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson';

/*Напишете заявка, която извежда имената на актьорите, които са
участвали във филм от 1980 или във филм, в чието заглавие има думата
‘Knight’*/
SELECT starname
FROM starsin
WHERE movieyear = 1980 or movietitle like '%Knight%';

/*Напишете заявка, която извежда имената на продуцентите с нетни
активи над 10 000 000 долара*/
SELECT name
FROM movieexec
WHERE networth >= 10e6;


/*Напишете заявка, която извежда имената на актьорите, които са мъже
или живеят на Prefect Rd.
*/
SELECT name
FROM moviestar
WHERE gender = 'M' or address = 'Prefect Rd';