import mysql.connector
import random


mydb = mysql.connector.connect(
    host="localhost",
    user="me",
    passwd="myUserPassword",
    database="dswork"
    
)
print("Connected to database")
cur = mydb.cursor(buffered=True)


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


class Person:
    def __init__(self, first_name, last_name, birth_year):
        self.first_name = first_name
        self.last_name = last_name
        self.birth_year = birth_year 
  
        
class Film:
    def __init__(self, title, year):
        self.title = title
        self.year = year
    
class Award:
    def __init__(self, name, year):
        self.name = name
        self.year = year

class Winner:
    def __init__(self, person, film, award):
        self.person = person
        self.film = film
        self.award = award

class Festival:
    def __init__(self, id, name):
        self.id = id
        self.name = name
       

class Venue:
    def __init__(self, id, time, place: None):
        self.id = id
        self.time = time
        self.place = place

class ScheduleOfFilm():
    def __init__(self, year, film):
        self.year = year
        self.film = film
        



people = []
awards = []
films = []
workers = []
winners = []
festivals = []
venues = []
scheduled_films = []


rows = []

# Read the data from the file
with open('the_oscar_award.csv', 'r') as f:
    f.readline()
    for line in f:
        line = line.split(',')
        if(len(line) < 8):
            rows.append(line)
    

for i in range(1, 93):
    festival = Festival(i, "Oscars")    
    festivals.append(festival)


for idx, row in enumerate(rows, 1):
    film = Film(row[5], row[0])
    if(film.title != '' and film not in films):
        films.append(film) 
    
    if(len(row[4].split(' ')) > 2 or len(row[4].split(' ')) < 2):
        pass
    else:
        first_name = row[4].split(' ')[0]
        last_name = row[4].split(' ')[1]
        person = Person(first_name, last_name, 1900)
        
    if(person not in people):
        people.append(person)
    # if(worker not in workers):
    # workers.append(worker)
    
    award = Award(row[3], row[1])
    if(award not in awards):
        awards.append(award)
    
    if('True' in row[6]):
        winner = Winner(person, film, award)
        winners.append(winner)
    
    venue = Venue(row[2], row[1], None)
    if len(venues) == 0 or venues[len(venues) -1 ].time != venue.time :
        venues.append(venue)
    if(film.title != ''):
        schedule = ScheduleOfFilm(row[1], film)
        scheduled_films.append(schedule)


print(len(venues))




# for award in awards:
#     print(award.id, award.name)

# for film in films:
#     print(film.id, film.title, film.year)

# for person in people:
#     print(person.id, person.first_name, person.last_name, person.birth_year)

# for worker in workers:
#     print(worker.id, "FN:" + worker.first_name, "LN:" + worker.last_name, worker.birth_year, worker.film_id)

# for winner in winners:
#    print(winner.person.first_name, winner.person.last_name, winner.film.title, winner.award.name)

# for venue in venues:
#     print(venue.id, venue.time, venue.place)


cur = mydb.cursor()
for person in people:
    cur.execute("INSERT INTO People (first_name, last_name, birth_year) VALUES (%s, %s, %s)", ( person.first_name, person.last_name, person.birth_year))

mydb.commit()

for award in awards:
    cur.execute("INSERT INTO Award (name, year) VALUES (%s, %s)", (award.name, award.year))

mydb.commit()

for film in films:
    cur.execute("INSERT INTO Film (title, year, director_id, length, genre) VALUES (%s, %s, %s, %s, %s)", (film.title, film.year, random.randint(1,800), random.randint(60, 120), random.choice(possible_genres)))  
    
mydb.commit()

print(len(winners))

for winner in winners:
    
    people_id = cur.execute("SELECT people_id FROM People WHERE first_name = %s AND last_name = %s", (winner.person.first_name, winner.person.last_name))
    people_id = cur.fetchone()[0]
    # print(people_id)
    cur.fetchall()
    cur.reset()
    award_id = cur.execute("SELECT award_id FROM Award WHERE name = %s AND year = %s", (winner.award.name, winner.award.year))
    award_id = cur.fetchone()[0]
    # print(award_id)
    cur.fetchall()
    cur.reset()
    film_id = cur.execute("SELECT film_id FROM Film WHERE title = %s AND year = %s", (winner.film.title, winner.film.year))
    try:
        film_id = cur.fetchone()[0]
    except:
        pass
    cur.reset()
    cur.fetchall()
    try:
        cur.execute("INSERT INTO Award_Winner(people_id, award_id, film_id) VALUES (%s, %s, %s)", (people_id, award_id, film_id))
    except:
        pass
    cur.fetchall()
    cur.reset()
    
mydb.commit()
    


for festival in festivals:
    cur.execute("INSERT INTO Festival (festival_id, festival_name, runtime) VALUES (%s, %s, %s)", (festival.id, festival.name, random.randint(120, 400)))

mydb.commit()

for venue in venues:
    cur.execute("INSERT INTO Venue (festival_id, year, place) VALUES (%s, %s, %s)", (venue.id, venue.time,  potential_locations[random.randint(0, len(potential_locations) - 1)]))

mydb.commit()

for scheduled_film in scheduled_films:
    cur.execute("SELECT film_id FROM Film WHERE title = %s AND year = %s", (scheduled_film.film.title, scheduled_film.film.year))
    film_id = cur.fetchone()[0]
    cur.fetchall()
    cur.reset()
    query = "SELECT festival_id FROM Venue WHERE year = %s"
    
    cur.execute(query, (scheduled_film.year,))
    venue_id = cur.fetchone()[0]
    try:
        cur.execute("INSERT INTO Scheduled_Film (film_id, festival_id) VALUES (%s, %s)", (film_id, venue_id))
    except:
        pass
    cur.fetchall()
    cur.reset()
    
cur.fetchall()
mydb.commit()
cur.close()

mydb.close()
