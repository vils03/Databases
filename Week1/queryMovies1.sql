USE Movies;

--�������� ������, ����� ������� ������ �� ������ �Disney�
SELECT address
FROM studio
WHERE name = 'Disney';

--�������� ������, ����� ������� ��������� ���� �� ������� Jack Nicholson
SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson';

/*�������� ������, ����� ������� ������� �� ���������, ����� ��
��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������
�Knight�*/
SELECT starname
FROM starsin
WHERE movieyear = 1980 or movietitle like '%Knight%';

/*�������� ������, ����� ������� ������� �� ������������ � �����
������ ��� 10 000 000 ������*/
SELECT name
FROM movieexec
WHERE networth >= 10e6;


/*�������� ������, ����� ������� ������� �� ���������, ����� �� ����
��� ������ �� Prefect Rd.
*/
SELECT name
FROM moviestar
WHERE gender = 'M' or address = 'Prefect Rd';