USE Ships;

/*�������� ������, ����� ������� ����� � �������� �� ������ 
������� � ��-����� �� 10 ������*/
SELECT class, country
FROM classes
WHERE numguns < 10;

/*�������� ������, ����� ������� ������� �� ��������, ������� �� ����
����� 1918. ������� ��������� shipName �� ��������.*/
SELECT name as 'shipName'
FROM ships
WHERE launched < 1918;

/*�������� ������, ����� ������� ������� �� ��������, �������� � �����
� ������� �� ����������� �����*/
SELECT ship
FROM outcomes
WHERE result = 'sunk';

/*�������� ������, ����� ������� ������� �� �������� � ���, ���������
� ����� �� ������ ����.*/SELECT nameFROM shipsWHERE name = class;/*�������� ������, ����� ������� ������� �� ��������, ����� �������� �
������� R.*/
SELECT name
FROM ships
WHERE name like 'R%';

/*�������� ������, ����� ������� ������� �� ��������, ����� �������� 2
��� ������ ����*/
SELECT name
FROM ships
WHERE name like '% %';