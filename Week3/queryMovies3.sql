USE Movies;

/*. �������� ������, ����� ������� ������� �� ���������,
����� �� ���� �
���������� � ����� ������ ��� 10 �������.*/
SELECT name
FROM moviestar
WHERE name IN (SELECT name
				FROM movieexec
				WHERE networth >= 10000000);


/*�������� ������, ����� ������� ������� �� ���� �������
(���� � ����),
����� �� �� ����������.
*/
SELECT name
FROM moviestar
WHERE name NOT IN (SELECT name
					FROM movieexec);


/*�������� ������, ����� ������� ������� �� ������
����� � �������,
��-������ �� ��������� �� ����� �Star Wars�*/
SELECT m1.title
FROM movie m1
WHERE m1.length > (SELECT m2.length 
				    FROM movie m2
					WHERE m2.title = 'Star Wars');

/*�������� ������, ����� ������� ������� �� 
������������ � ������� ��
������� �� ������ �����, ����� �� ����������� �� 
���������� � �����
������ ��-������ �� ���� �� �Merv Griffin�
*/
SELECT title, mv1.name
FROM movie  JOIN movieexec mv1 ON cert# = producerc# 
WHERE mv1.networth > (SELECT networth
				  FROM movieexec mv2
				  WHERE mv2.name = 'Merv Griffin');

