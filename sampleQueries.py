import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="root",
    database="default_db"
    
)
print("Connected to database")
cur = mydb.cursor(buffered=True)


def CreateTable(query):
    cur.execute(query)
    if(cur.rowcount == 0):
        print("Film table created")
    else:
        print("Film table already exists")

def SelectTable(query):
    cur.execute(query)
    print(cur.column_names)
    for row in cur:
        print(row)



# CreateTable("CREATE TABLE IF NOT EXISTS Film (film_id INTEGER NOT NULL AUTO_INCREMENT, title VARCHAR(255) NOT NULL, genre VARCHAR(255) NOT NULL, year INTEGER NOT NULL, director_id INTEGER NOT NULL, length INTEGER NOT NULL, PRIMARY KEY(film_id))")



# -- Which actors or directors won an award at the Oscars?

SelectTable("SELECT People.first_name, People.last_name, People.people_id, Award.name as 'Won Award For' FROM People JOIN Award_Winner ON Award_Winner.people_id = People.people_id JOIN Award ON Award.award_id = Award_Winner.award_id")

# -- Which actors won the most awards?

SelectTable("SELECT People.first_name, People.last_name, People.people_id, COUNT(Award.name) as 'Number of Awards Won' FROM People JOIN Award_Winner ON Award_Winner.people_id = People.people_id JOIN Award ON Award.award_id = Award_Winner.award_id GROUP BY people_id ORDER BY COUNT(Award.name) DESC")

# -- Which films won the most awards?

SelectTable("SELECT Film.title, Film.film_id, COUNT(Award.name) as 'Number of Awards Won' FROM Film JOIN Award_Winner ON Award_Winner.film_id = Film.film_id JOIN Award ON Award.award_id = Award_Winner.award_id GROUP BY film_id ORDER BY COUNT(Award.name) DESC")

# -- Which films were the longest?

SelectTable("SELECT Film.title, Film.film_id, Film.length FROM Film ORDER BY Film.length DESC")

# -- Which films were the shortest?

SelectTable("SELECT Film.title, Film.film_id, Film.length FROM Film ORDER BY Film.length ASC")

# -- Which films were at each festival?

SelectTable("SELECT Film.title as 'Film Title', Festival.festival_name as 'Festival Name', Venue.place as 'Festival Location', Venue.year as 'Year' FROM Film JOIN Scheduled_Film ON Scheduled_Film.film_id = Film.film_id JOIN Festival ON Festival.festival_id = Scheduled_Film.festival_id JOIN Venue ON Venue.festival_id = Festival.festival_id")

# -- Which film won the most awards in a decade?

SelectTable("SELECT Film.title as 'Film Title', Film.film_id, Film.year as 'Year', COUNT(Award.name) as 'Number of Awards Won' FROM Film JOIN Award_Winner ON Award_Winner.film_id = Film.film_id JOIN Award ON Award.award_id = Award_Winner.award_id WHERE Film.year BETWEEN 2000 AND 2009 GROUP BY film_id ORDER BY COUNT(Award.name) DESC")

# -- Which Festival showcased the most films?

SelectTable("SELECT Festival.festival_name as 'Festival Name', Venue.year as 'Year', COUNT(Scheduled_Film.film_id) as 'Number of Films' FROM Festival JOIN Scheduled_Film ON Scheduled_Film.festival_id = Festival.festival_id JOIN Venue ON Venue.festival_id = Festival.festival_id GROUP BY Festival.festival_id ORDER BY COUNT(Scheduled_Film.film_id) DESC")

# -- Who directed the most award winning films

SelectTable("SELECT People.first_name as 'Director First Name', People.last_name as 'Director Last Name', COUNT(Award.name) as 'Number of Awards Won' FROM People JOIN Film ON Film.director_id = People.people_id JOIN Award_Winner ON Award_Winner.film_id = Film.film_id JOIN Award ON Award.award_id = Award_Winner.award_id GROUP BY People.people_id ORDER BY COUNT(Award.name) DESC")

# -- Find the most award winning genre

SelectTable("SELECT Film.genre, COUNT(Award.name) as 'Number of Awards Won' FROM Film JOIN Award_Winner ON Award_Winner.film_id = Film.film_id JOIN Award ON Award.award_id = Award_Winner.award_id GROUP BY Film.genre ORDER BY COUNT(Award.name) DESC LIMIT 10")