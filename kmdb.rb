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

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model

# BC Notes //I used 'rails generate model Movies/People/Roles' to create the models
# Then I set up the tables in db->migrate->create_[model name]
# Then I ran 'rails db:migrate'
# I committed the code before and after the migration for easy reference // End of notes for this section

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.

# Begin Movie Insert
values = {
    title: "Batman Begins",
    year_released: 2005,
    rated: "PG-13"
    }

movies = Movie.new(values)
movies.save

values = {
    title: "The Dark Knight",
    year_released: 2008,
    rated: "PG-13"
    }

movies = Movie.new(values)
movies.save

values = {
    title: "The Dark Knight Rises",
    year_released: 2012,
    rated: "PG-13"
    }

movies = Movie.new(values)
movies.save
# End Movie Insert
# Begin People Insert
# Batman Begins
people_list = {name: "Christopher Nolan"}
people = Person.new(people_list)
people.save 

people_list = {name: "Christian Bale"}
people = Person.new(people_list)
people.save 

people_list = {name: "Michael Caine"}
people = Person.new(people_list)
people.save 

people_list = {name: "Liam Neeson"}
people = Person.new(people_list)
people.save 

people_list = {name: "Katie Holmes"}
people = Person.new(people_list)
people.save 

people_list = {name: "Gary Oldman"}
people = Person.new(people_list)
people.save 

# The Dark Knight

people_list = {name: "Heath Ledger"}
people = Person.new(people_list)
people.save 

people_list = {name: "Aaron Eckhart"}
people = Person.new(people_list)
people.save 

people_list = {name: "Maggie Gyllenhaal"}
people = Person.new(people_list)
people.save 

# The Dark Knight Rises

people_list = {name: "Tomy Hardy"}
people = Person.new(people_list)
people.save 

people_list = {name: "Joseph Gordon-Levitt"}
people = Person.new(people_list)
people.save 

people_list = {name: "Anne Hathaway"}
people = Person.new(people_list)
people.save 

# End People
# Assigning Roles

role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = Movie.where({title: "Batman Begins"})[0]
role.person_id = Person.where({name: "Christian Bale"})[0]
role.save


# End of roles assignment

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
