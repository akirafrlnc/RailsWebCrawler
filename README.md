Architecture Decision Record (ADR) for Web Crawler with Filtering Operations in Rails using SQLite3
Title: Designing a Web Crawler for Extracting and Filtering Data from https://news.ycombinator.com/ using Rails with SQLite3

Context
We are tasked with building a web crawler in a Rails application to extract the first 30 entries from https://news.ycombinator.com/ and perform filtering operations based on title word count and ordering by comments/points. The solution should store usage data and provide insights into user interaction and crawler behavior.

Decision
1. Web Scraping Gem: Utilize the Nokogiri gem in Rails for web scraping to extract data from the website.

2. Data Extraction: Parse the HTML content to extract the number, title, points, and number of comments for each entry.

3. Storage: Store the extracted data and usage data in a SQLite3 database to track user interactions and crawler behavior.

4. Filtering Operations:
Implement filtering logic in the Rails application to filter entries based on title word count greater than 5 or less and ordering by comments/points.

5. Code Organization: Follow Rails conventions and MVC pattern to ensure clean, well-structured code, avoiding repetition, and maintaining consistency.

6. Version Control: Utilize Git for version control, maintaining a good commit history.

7. Automated Testing: Implement automated tests using RSpec to validate the extracting and filtering operations.

8.Documentation: Provide detailed documentation explaining key design decisions, code organization, and additional fields tracked for user interaction and crawler behavior.

Consequences
-By using the Nokogiri gem for web scraping in Rails, we ensure efficient data extraction from the website.
-Storing data in a SQLite3 database allows for effective tracking of user interactions and crawler behavior.
-Following Rails conventions and MVC pattern enhances code maintainability and readability.
-Automated testing with RSpec ensures the correctness of filtering operations and overall system reliability.
-Detailed documentation and a ReadMe file provide clarity and guidance for users interacting with the Rails application.


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
bundle exec rspec spec/controllers/scraped_entries_controller_spec.rb
