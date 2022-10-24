
from DbManager import DbManager
from generateData import generateData
DbManager = DbManager()
DbManager.connect()

people, awards, films, winners, festivals, venues, scheduled_films = generateData()

# Insert all the people into the database

# Insert all people who have been nominated for an award
for person in people:
    DbManager.insertPerson(person)

# Insert all the awards into the database
for award in awards:
    DbManager.insertAward(award)
    
# Insert all the films into the database
for film in films:
    DbManager.insertFilm(film)

# Insert all the winners into the database
for winner in winners:
    people_id = DbManager.getPersonId(winner.person.first_name, winner.person.last_name)
    award_id = DbManager.getAwardId(winner.award.name, winner.award.year)
    film_id = None
    # A try catch block is used here because some films have odd data
    try:
        film_id = DbManager.getFilmId(winner.film.title, winner.film.year)
    except:
        pass
    # A try catch is done here because this may error for odd reasons sometimes  
    try:
       DbManager.insertAwardWinner(people_id, award_id, film_id)
    except:
        pass
   
# Insert all the festivals into the database
for festival in festivals:
    DbManager.insertFestival(festival)

# Insert all the venues into the database
for venue in venues:
    DbManager.insertVenue(venue)

# Insert all the scheduled films into the database
for scheduled_film in scheduled_films:
    
    film_id = DbManager.getFilmId(scheduled_film.film.title, scheduled_film.film.year)
    # The id of the venue is a foreign key of festival so can be used to get the festival id
    venue_id = DbManager.getFestivalIdFromVenue(scheduled_film.year)
    try:
       DbManager.insertScheduleOfFilm(film_id, venue_id)
    except:
        pass
   
