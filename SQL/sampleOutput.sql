mysql> \. Questions.sql
+------------+-----------+----------------------------------+
| first_name | last_name | Won Award For                    |
+------------+-----------+----------------------------------+
| Emil       | Jannings  | ACTOR                            |
| Janet      | Gaynor    | ACTRESS                          |
| Rochus     | Gliese    | ART DIRECTION                    |
| George     | Barnes    | CINEMATOGRAPHY                   |
| George     | Barnes    | CINEMATOGRAPHY (Black-and-White) |
| Charles    | Rosher    | CINEMATOGRAPHY                   |
| Karl       | Struss    | CINEMATOGRAPHY                   |
| Lewis      | Milestone | DIRECTING (Comedy Picture)       |
| Lewis      | Milestone | DIRECTING                        |
| Frank      | Borzage   | DIRECTING (Dramatic Picture)     |
| Frank      | Borzage   | DIRECTING                        |
| King       | Vidor     | OUTSTANDING PRODUCTION           |
| Roy        | Pomeroy   | ENGINEERING EFFECTS              |
| Nugent     | Slaughter | OUTSTANDING PICTURE              |
| Nugent     | Slaughter | UNIQUE AND ARTISTIC PICTURE      |
| Benjamin   | Glazer    | WRITING (Adaptation)             |
| Ben        | Hecht     | WRITING (Original Story)         |
| Ben        | Hecht     | WRITING (Screenplay)             |
| Warner     | Baxter    | ACTOR                            |
| Paul       | Muni      | ACTOR                            |
+------------+-----------+----------------------------------+
20 rows in set (0.00 sec)

+------------+-------------+----------------------+
| first_name | last_name   | Number of Awards Won |
+------------+-------------+----------------------+
| John       | Williams    |                   27 |
| Warner     | Bros.       |                   21 |
| Alfred     | Newman      |                   16 |
| Wylie      | Stateman    |                   13 |
| Thomas     | Newman      |                   10 |
| Richard    | King        |                    9 |
| Thelma     | Schoonmaker |                    8 |
| Michael    | Kahn        |                    7 |
| Michel     | Legrand     |                    7 |
| 20th       | Century-Fox |                    6 |
+------------+-------------+----------------------+
10 rows in set (0.01 sec)

+-----------------------------------------------+----------------------+
| Film Title                                    | Number of Awards Won |
+-----------------------------------------------+----------------------+
| On the Waterfront                             |                    7 |
| The Lord of the Rings: The Return of the King |                    7 |
| The Best Years of Our Lives                   |                    7 |
| The English Patient                           |                    7 |
| Gigi                                          |                    7 |
| Going My Way                                  |                    6 |
| The Sting                                     |                    6 |
| Slumdog Millionaire                           |                    6 |
| West Side Story                               |                    6 |
| Gone with the Wind                            |                    6 |
+-----------------------------------------------+----------------------+
10 rows in set (0.00 sec)

+-------------------+-------------+
| Film Title        | Film Length |
+-------------------+-------------+
| The Noose         |        NULL |
| The Last Command  |        NULL |
| A Ship Comes In   |        NULL |
| 7th Heaven        |        NULL |
| Sadie Thompson    |        NULL |
| Sunrise           |        NULL |
| The Dove;         |        NULL |
| 7th Heaven        |        NULL |
| The Devil Dancer; |        NULL |
| Sunrise           |        NULL |
+-------------------+-------------+
10 rows in set (0.01 sec)

+-------------------+-------------+
| Film Title        | Film Length |
+-------------------+-------------+
| The Noose         |        NULL |
| The Last Command  |        NULL |
| A Ship Comes In   |        NULL |
| 7th Heaven        |        NULL |
| Sadie Thompson    |        NULL |
| Sunrise           |        NULL |
| The Dove;         |        NULL |
| 7th Heaven        |        NULL |
| The Devil Dancer; |        NULL |
| Sunrise           |        NULL |
+-------------------+-------------+
10 rows in set (0.00 sec)

+---------------------+---------------+-----------------------------------------------------+------+
| Film Title          | Festival Name | Festival Location                                   | Year |
+---------------------+---------------+-----------------------------------------------------+------+
| The Noose           | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| The Last Command    | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| A Ship Comes In     | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| 7th Heaven          | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| Sadie Thompson      | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| Sunrise             | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| The Dove;           | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| The Devil Dancer;   | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| Two Arabian Knights | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
| Speedy              | Oscars        | Santa Monica Civic Auditorium, Santa Monica, Calif. | 1928 |
+---------------------+---------------+-----------------------------------------------------+------+
10 rows in set (0.00 sec)

+-----------------------------------------------+------+----------------------+
| Film Title                                    | Year | Number of Awards Won |
+-----------------------------------------------+------+----------------------+
| The Lord of the Rings: The Return of the King | 2003 |                    7 |
| Slumdog Millionaire                           | 2008 |                    6 |
| The Aviator                                   | 2004 |                    5 |
| The Hurt Locker                               | 2009 |                    5 |
| Traffic                                       | 2000 |                    4 |
| Chicago                                       | 2002 |                    4 |
| Memoirs of a Geisha                           | 2005 |                    3 |
| A Beautiful Mind                              | 2001 |                    3 |
| Million Dollar Baby                           | 2004 |                    3 |
| No Country for Old Men                        | 2007 |                    3 |
+-----------------------------------------------+------+----------------------+
10 rows in set (0.00 sec)

+---------------+------+-----------------+
| Festival Name | Year | Number of Films |
+---------------+------+-----------------+
| Oscars        | 1942 |              74 |
| Oscars        | 1943 |              72 |
| Oscars        | 1944 |              71 |
| Oscars        | 2012 |              58 |
| Oscars        | 2008 |              57 |
| Oscars        | 2007 |              55 |
| Oscars        | 2010 |              55 |
| Oscars        | 2016 |              53 |
| Oscars        | 1945 |              53 |
| Oscars        | 1946 |              53 |
+---------------+------+-----------------+
10 rows in set (0.02 sec)

+---------------------+--------------------+----------------------+
| Director First Name | Director Last Name | Number of Awards Won |
+---------------------+--------------------+----------------------+
| Frank               | Lloyd              |                   28 |
| Warner              | Baxter             |                   27 |
| Betty               | Compson            |                   26 |
| Lajos               | Biro               |                   25 |
| Cedric              | Gibbons            |                   24 |
| George              | Barnes             |                   24 |
| Ernst               | Lubitsch           |                   23 |
| (Victor             | Milner)            |                   23 |
| Richard             | Barthelmess        |                   22 |
| Bess                | Meredyth           |                   21 |
+---------------------+--------------------+----------------------+
10 rows in set (0.02 sec)

+--------------------+----------------------+
| genre              | Number of Awards Won |
+--------------------+----------------------+
| Crime              |                  180 |
| Fantasy            |                  166 |
| Historical         |                  164 |
| Comedy             |                  162 |
| Drama              |                  159 |
| Adventure          |                  142 |
| Horror             |                  140 |
| Action             |                  140 |
| Historical fiction |                  122 |
+--------------------+----------------------+
9 rows in set (0.01 sec)

