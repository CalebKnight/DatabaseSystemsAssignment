import mysql.connector
from classes import Person, Film, Award, Winner, Festival, Venue, ScheduleOfFilm
import random

potential_locations = [
    "Roosevelt Hotel",
    "Ambassador Hotel",
    "Bitmore Hotel",
    "Grauman's Chinese Theatre, Los Angeles",
    "NBC International Theatre, New York",
    "Santa Monica Civic Auditorium, Santa Monica, Calif."
]

possible_genres =[
    "Action",
    "Adventure",
    "Comedy",
    "Crime",
    "Drama",
    "Fantasy",
    "Historical",
    "Historical fiction",
    "Horror",
]


# While this file could be compartmentalised more it would take too long to do so

class DbManager:
    def init (self, mydb):
        self.mydb = mydb
        self.cur = mydb.cursor()


    def connect(self):
        self.mydb = mysql.connector.connect(
            host="localhost",
            user="me",
            password="myUserPassword",
            database="dswork"
        )
        print("Connected to database")
        self.cur = self.mydb.cursor(buffered=True)
    
    def insertPerson(self, person):
        sql = "INSERT INTO People (first_name, last_name, birth_year) VALUES (%s, %s, %s)"
        val = (person.first_name, person.last_name, person.birth_year)
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")
        
    def insertAward(self, award):
        sql = "INSERT INTO Award (name, year) VALUES (%s, %s)"
        val = (award.name, award.year)
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")

    def insertFilm(self, film):
        sql = "INSERT INTO Film (title, year, director_id, genre) VALUES (%s, %s, %s, %s)"
        val = (film.title, film.year, random.randint(1, 100), possible_genres[random.randint(0, len(possible_genres) - 1)])
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")

    def getPersonId(self, first_name, last_name):
        sql = "SELECT people_id FROM People WHERE first_name = %s AND last_name = %s"
        val = (first_name, last_name)
        self.cur.execute(sql, val)
        people_id = self.cur.fetchone()[0]
        return people_id

    def getFilmId(self, title, year):
        sql = "SELECT film_id FROM Film WHERE title = %s AND year = %s"
        val = (title, year)
        self.cur.execute(sql, val)
        film_id = self.cur.fetchone()[0]
        return film_id

    def getAwardId(self, name, year):
        sql = "SELECT award_id FROM Award WHERE name = %s AND year = %s"
        val = (name, year)
        self.cur.execute(sql, val)
        award_id = self.cur.fetchone()[0]
        return award_id

    def insertAwardWinner(self, people_id, award_id, film_id):
        sql = "INSERT INTO Award_Winner (people_id, award_id, film_id) VALUES (%s, %s, %s)"
        val = (people_id, award_id, film_id)
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")

    def insertFestival(self, festival):
        sql = "INSERT INTO Festival (festival_id, festival_name, runtime) VALUES (%s, %s, %s)"
        val = (festival.id, festival.name, random.randint(120, 400))
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")

    def insertVenue(self, venue):
        sql = "INSERT INTO Venue (festival_id, year, place) VALUES (%s, %s, %s)"
        val = (venue.id, venue.time, potential_locations[random.randint(0, len(potential_locations) - 1)])
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")
    
    def getFestivalIdFromVenue(self, year):
        sql = "SELECT festival_id FROM Venue WHERE year = %s"
        val = (year,)
        self.cur.execute(sql, val)
        festival_id = self.cur.fetchone()[0]
        return festival_id

    def insertScheduleOfFilm(self, schedule):
        sql = "INSERT INTO Scheduled_Film (film_id, festival_id) VALUES (%s, %s)"
        val = (schedule.film_id, schedule.festival_id)
        self.cur.execute(sql, val)
        self.mydb.commit()
        # print(self.cur.rowcount, "record inserted.")

    

