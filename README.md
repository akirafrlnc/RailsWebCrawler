## Designing a Web Crawler for Extracting and Filtering Data from https://news.ycombinator.com/ using Rails with SQLite3

### Context

building a web crawler in a Rails application to extract the first 30 entries from https://news.ycombinator.com/ and perform filtering operations based on title word count and ordering by comments/points. The solution should store usage data.

### Decision

1. Web Scraping Gem: Utilize the Nokogiri gem in Rails for web scraping to extract data from the website.

2. Data Extraction: Parse the HTML content to extract the number, title, points, and number of comments for each entry.

3. Storage: Store the extracted data and usage data in a SQLite3 database to track user interactions and crawler behavior.

4. Filtering Operations:
Implement filtering logic in the Rails application to filter entries based on title word count greater than 5 or less and ordering by comments/points.

5. Testing: Implement automated tests using RSpec to validate the model, extracting and filtering operations.

###Consequences

- By using the Nokogiri gem for web scraping in Rails, we ensure efficient data extraction from the website.

- Storing data in a SQLite3 database allows for tracking crawler behavior.

- Automated testing with RSpec ensures the correctness of extracting and filtering operations.


## Overview
This Rails application implements a web crawler to extract data from Hacker News (https://news.ycombinator.com/). It retrieves the first 30 entries, including the number, title, points, and comments for each entry. The application allows filtering based on title length and comments/points, storing usage data and applied filters.

## Setup
### Ruby Version
- Ruby version: 3.1.2

### Rails Version
- Rails version: 7.0.8.4

### System Dependencies
- Nokogiri gem

## Database
### Database Creation
- sqlite3

### Database Initialization
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

- dependencies in Gemfile

  gem "rspec-rails"

  gem "shoulda-matchers"

	gem "rails-controller-testing"

- Run the test suite using:

	bundle exec rspec
