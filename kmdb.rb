# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# run rails generate model Movie
# run rails generate model Person
# run rails generate model Role

# open db/migrate files and add columns

# run rails db:migrate

# test
# puts "there are #{Movie.all.count} movies"
# puts "there are #{Person.all.count} people"
# puts "there are #{Role.all.count} roles"

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# insert data to person

person = Person.new 
person.name = "Christian Bale"
person.save
bale = Person.where({name: "Christian Bale"})[0]

person = Person.new 
person.name = "Michael Caine"
person.save
craine = Person.where({name: "Michael Caine"})[0]

person = Person.new 
person.name = "Liam Neeson"
person.save
neeson = Person.where({name: "Liam Neeson"})[0]

person = Person.new 
person.name = "Katie Holmes"
person.save
holmes = Person.where({name: "Katie Holmes"})[0]

person = Person.new 
person.name = "Gary Oldman"
person.save
oldman = Person.where({name: "Gary Oldman"})[0]

person = Person.new 
person.name = "Heath Ledger"
person.save
ledger = Person.where({name: "Heath Ledger"})[0]

person = Person.new 
person.name = "Aaron Eckhart"
person.save
eckhart = Person.where({name: "Aaron Eckhart"})[0]

person = Person.new 
person.name = "Maggie Gyllenhaal"
person.save
gyllenhaal = Person.where({name: "Maggie Gyllenhaal"})[0]

person = Person.new 
person.name = "Tom Hardy"
person.save
hardy = Person.where({name: "Tom Hardy"})[0]

person = Person.new 
person.name = "Joseph Gordon-Levitt"
person.save
levitt = Person.where({name: "Joseph Gordon-Levitt"})[0]


person = Person.new 
person.name = "Anne Hathaway"
person.save
hathaway = Person.where({name: "Anne Hathaway"})[0]


person = Person.new 
person.name = "Christopher Nolan"
person.save
nolan = Person.where({name: "Christopher Nolan"})[0]


# test
# puts "there are #{Person.all.count} people"

values = { title: "Batman Begins", year_released: "2005", rating: "PG-13", person_id: nolan.id }
batman_begins = Movie.new(values)
batman_begins.save

values = { title: "The Dark Knight", year_released: "2008", rating: "PG-13", person_id: nolan.id }
dark_night = Movie.new(values)
dark_night.save

values = { title: "The Dark Knight Rises", year_released: "2012", rating: "PG-13", person_id: nolan.id }
dark_night_rises = Movie.new(values)
dark_night_rises.save

# test
# puts "there are #{Movie.all.count} movies"


role = Role.new 
role.movie_id = batman_begins.id 
role.person_id = bale.id 
role.character_name = "Bruce Wayne"
role.save 

role = Role.new 
role.movie_id = batman_begins.id 
role.person_id = craine.id 
role.character_name = "Alfred"
role.save 

role = Role.new 
role.movie_id = batman_begins.id 
role.person_id = neeson.id 
role.character_name = "Ra's Al Ghul"
role.save 

role = Role.new 
role.movie_id = batman_begins.id 
role.person_id = holmes.id 
role.character_name = "Rachel Dawes"
role.save 

role = Role.new 
role.movie_id = batman_begins.id 
role.person_id = oldman.id 
role.character_name = "Commissioner Gordon"
role.save 

role = Role.new 
role.movie_id = dark_night.id 
role.person_id = bale.id 
role.character_name = "Bruce Wayne"
role.save 

role = Role.new 
role.movie_id = dark_night.id 
role.person_id = ledger.id 
role.character_name = "Joker"
role.save 

role = Role.new 
role.movie_id = dark_night.id 
role.person_id = eckhart.id 
role.character_name = "Harvey Dent"
role.save 

role = Role.new 
role.movie_id = dark_night.id 
role.person_id = craine.id 
role.character_name = "Alfred"
role.save 

role = Role.new 
role.movie_id = dark_night.id 
role.person_id = gyllenhaal.id 
role.character_name = "Rachel Dawes"
role.save 

role = Role.new 
role.movie_id = dark_night_rises.id 
role.person_id = bale.id 
role.character_name = "Bruce Wayne"
role.save 

role = Role.new 
role.movie_id = dark_night_rises.id 
role.person_id = oldman.id 
role.character_name = "Commissioner Gordon"
role.save 

role = Role.new 
role.movie_id = dark_night_rises.id 
role.person_id = hardy.id 
role.character_name = "Bane"
role.save 

role = Role.new 
role.movie_id = dark_night_rises.id 
role.person_id = levitt.id 
role.character_name = "John Blake"
role.save 

role = Role.new 
role.movie_id = dark_night_rises.id 
role.person_id = hathaway.id 
role.character_name = "Selina Kyle"
role.save 


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
people = Person.all
roles = Role.all


    for movie in movies
      person = Person.where({id: movie.person_id})[0]
      puts "#{movie.title} - #{movie.year_released} - #{movie.rating} - #{person.name}"
    end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

for role in roles
  movie = Movie.where({id: role.movie_id})[0]
  person = Person.where({id: role.person_id})[0]
  puts "#{movie.title} - #{person.name} - #{role.character_name}"
end