## Overview
This Rails application implements a web crawler to extract data from Hacker News (https://news.ycombinator.com/). It retrieves the first 30 entries, including the number, title, points, and comments for each entry. The application allows filtering based on title length and comments/points, storing usage data and applied filters.

## Setup
### Ruby Version
- Ruby version: 3.1.2

### System Dependencies
- Nokogiri gem
- OpenURI gem

## Configuration
- Add any additional configuration steps here.

## Database
### Database Creation
sqlite3

### Database Initialization
- Provide steps for initializing the database.
splite3 is a default database for this rails project.
run the command below to create database:
rails db:migrate

## Running the Application
run the local server with the command:
rails s

and go to the links below to see desired results from the site.
the first 30 entries
http://localhost:3000/scrape_data

filter by title length greater than 5 and ordered by comments
http://localhost:3000/filter_by_title_length_and_comments

filter by title length less than or equal to 5 words and ordered by points
http://localhost:3000/filter_by_title_length_and_points

### How to Run the Test Suite
- Run the test suite using:
