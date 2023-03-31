USE PC;
 
/*�������� ������, ����� ������� ������������� � ��������� �� ��������� �
������ �� ����� ���� 9 GB*/
SELECT DISTINCT maker, speed
FROM product JOIN laptop
ON product.model = laptop.model
WHERE hd >= 9 and type = 'Laptop';
 
/*�������� ������, ����� ������� ����� � ���� �� ����������, ����������� ��
������������ � ��� B.*/
SELECT product.model, laptop.price
FROM product JOIN laptop
ON product.model = laptop.model
WHERE maker = 'B'
UNION
SELECT product.model, pc.price
FROM product JOIN pc
ON product.model = pc.model
WHERE maker = 'B'
UNION
SELECT product.model, printer.price
FROM product JOIN printer
ON product.model = printer.model
WHERE maker = 'B';
 

/*�������� ������, ����� ������� ���������������, ����� ����������� �������,
�� �� ����������� ���������� ��������.
*/

SELECT maker
FROM product JOIN laptop 
ON product.model = laptop.model 
EXCEPT
SELECT maker
FROM product JOIN pc
ON product.model = pc.model;


/*�������� ������, ����� ������� ��������� �� ���� �������, ����� �� ���������
� ���� ��� �������� ���������� ��������� (��� ��������� � �������� ���).*/

SELECT 
FROM pc AS p1 JOIN pc AS p2
ON p1.code != p2.code
WHERE 