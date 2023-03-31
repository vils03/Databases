USE pc;

/*Напишете заявка, която извежда производителите на персонални
компютри с честота над 500*/
SELECT DISTINCT maker
FROM pc JOIN product ON pc.model = product.model
WHERE speed > 500;
