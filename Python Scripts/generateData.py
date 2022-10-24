
from classes import Person, Film, Award, Winner, Festival, Venue, ScheduleOfFilm
def generateData():
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
        
    # Create the festivals, since we know there are 92 years of data this is easier hard coded
    for i in range(1, 93):
        festival = Festival(i, "Oscars")    
        festivals.append(festival)


    for idx, row in enumerate(rows, 1):
        # Grab the film data using the appropriate indexes
        film = Film(row[5], row[0])
        if(film.title != '' and film not in films):
            films.append(film) 
        
        if(len(row[4].split(' ')) > 2 or len(row[4].split(' ')) < 2):
            pass
        else:
            # Full name is stored in row[4] so split it into first and last name
            first_name = row[4].split(' ')[0]
            last_name = row[4].split(' ')[1]
            person = Person(first_name, last_name, 1900)
        
        # If person does not already exist (same actor could be working on multiple movies)
        # Append them to it
        if(person not in people):
            people.append(person)
        
        # If award doesn't already exist append it.
        # Duplicate awards don't matter too much since films can win the same award without too much issue
        award = Award(row[3], row[1])
        if(award not in awards):
            awards.append(award)
        
        # If they have won an award add them to winners
        if('True' in row[6]):
            winner = Winner(person, film, award)
            winners.append(winner)
        # Add a venue if it doesn't already exist
        # Venues are generally very randomised so this doesn't need to be perfect
        venue = Venue(row[2], row[1], None)
        if len(venues) == 0 or venues[len(venues) -1 ].time != venue.time :
            venues.append(venue)
        if(film.title != ''):
            schedule = ScheduleOfFilm(row[1], film)
            scheduled_films.append(schedule)
    return people, awards, films, winners, festivals, venues, scheduled_films