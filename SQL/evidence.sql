mysql> \. DeleteTables.sql
Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> \. CreateDB.sql
Query OK, 0 rows affected (0.04 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.05 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.04 sec)

Query OK, 0 rows affected (0.06 sec)

mysql> \. VerifyStructure.sql
+------------------+
| Tables_in_dswork |
+------------------+
| Award            |
| Award_Winner     |
| Festival         |
| Film             |
| People           |
| Scheduled_Film   |
| Venue            |
+------------------+
7 rows in set (0.00 sec)

+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| film_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| title       | varchar(255) | NO   |     | NULL    |                |
| genre       | varchar(255) | YES  |     | NULL    |                |
| year        | int(11)      | NO   |     | NULL    |                |
| director_id | int(11)      | NO   |     | NULL    |                |
| length      | int(11)      | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| people_id  | int(11)      | NO   | PRI | NULL    | auto_increment |
| birth_year | int(11)      | YES  |     | NULL    |                |
| death_year | int(11)      | YES  |     | NULL    |                |
| first_name | varchar(255) | YES  |     | NULL    |                |
| last_name  | varchar(255) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| award_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| name     | varchar(255) | NO   |     | NULL    |                |
| year     | int(11)      | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| award_id  | int(11) | NO   | PRI | NULL    |       |
| people_id | int(11) | NO   | PRI | NULL    |       |
| film_id   | int(11) | NO   | PRI | NULL    |       |
+-----------+---------+------+-----+---------+-------+
3 rows in set (0.01 sec)

+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| festival_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| festival_name | varchar(255) | NO   |     | NULL    |                |
| runtime       | int(11)      | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| place       | varchar(255) | NO   | PRI | NULL    |       |
| year        | int(11)      | NO   | PRI | NULL    |       |
| festival_id | int(11)      | NO   | MUL | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| film_id     | int(11) | NO   | PRI | NULL    |       |
| festival_id | int(11) | NO   | PRI | NULL    |       |
+-------------+---------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> tee sampleOutput.sql
