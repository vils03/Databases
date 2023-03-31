USE Movies;
 
 
/*Напишете заявка, която извежда имената на актьорите мъже, участвали във
филма The Usual Suspects*/
SELECT name
FROM starsin JOIN moviestar 
ON starname = name
WHERE gender = 'M' and movietitle = 'The Usual Suspects';
 
 
/* Íàïèøåòå çàÿâêà, êîÿòî èçâåæäà èìåíàòà íà àêòüîðèòå, ó÷àñòâàëè âúâ ôèëìè îò
1995, ïðîäóöèðàíè îò ñòóäèî MGM*/
SELECT starname
FROM movie JOIN starsin 
ON year = movieyear
WHERE year = 1995 and studioname = 'MGM';
 
 
/*Íàïèøåòå çàÿâêà, êîÿòî èçâåæäà èìåíàòà íà ïðîäóöåíòèòå, êîèòî ñà
ïðîäóöèðàëè ôèëìè íà ñòóäèî MGM*/
SELECT DISTINCT name
FROM movie JOIN movieexec
ON producerc# = cert#
WHERE studioname = 'MGM';
 
 
/*Íàïèøåòå çàÿâêà, êîÿòî èçâåæäà èìåíàòà íà ôèëìè ñ äúëæèíà, ïî-ãîëÿìà îò
äúëæèíàòà íà ôèëìà Star Wars*/
SELECT mv1.title
FROM movie as mv1, movie as mv2
WHERE mv2.title = 'Star Wars' and mv1.length > mv2.length;
 
/*Íàïèøåòå çàÿâêà, êîÿòî èçâåæäà èìåíàòà íà ïðîäóöåíòèòå 
ñ íåòíè àêòèâè ïîãîëåìè îò òåçè íà Stephen Spielberg*/
SELECT mv1.name
FROM movieexec as mv1, movieexec as mv2
WHERE mv2.name = 'Stephen Spielberg' and mv1.networth > mv2.networth;
 
 
 
 
