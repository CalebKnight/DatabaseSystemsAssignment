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