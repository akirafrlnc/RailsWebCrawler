require "open-uri"

class ScrapedEntriesController < ApplicationController
  def scrape_data
    # scraped_entries = scrape_entries

    @scraped_data = scrape_entries  # Store scraped data in @scraped_data

    # Save all scraped entries to the database
    ScrapedEntry.create(@scraped_data)

    render json: { message: "Data scraped and saved successfully", scraped_data: @scraped_data }
  end

  def filter_by_title_length_and_comments
    @scraped_data = scrape_entries  # Store scraped data in @scraped_data
    # filtered_entries = @scraped_data.select { |entry| count_words(entry[:title]) > 5 }
    filtered_entries = @scraped_data.select do |entry|
      word_count = count_words(entry[:title])
      entry.merge!(word_count: word_count)  # Add word count to the entry for debugging
      word_count > 5
    end
		.sort_by { |entry| entry[:comments] }
		.reverse

    # Save filtered entries to the database

    stored_entries = []

    filtered_entries.each do |filtered_entry|
			stored_entry = ScrapedEntry.create(number: filtered_entry[:number], title: filtered_entry[:title], points: filtered_entry[:points], comments: filtered_entry[:comments], timestamp: Time.now, filter: "filtered_by_comments")
			stored_entries << stored_entry.attributes.merge(word_count: filtered_entry[:word_count])  # Include word_count in the stored entry

    end

    render json: { message: "Filtered entries with more than five words in the title ordered by comments", filtered_data: stored_entries }
  end

  def filter_by_title_length_and_points
    @scraped_data = scrape_entries  # Store scraped data in @scraped_data

    filtered_entries = @scraped_data.select do |entry|
      word_count = count_words(entry[:title])
      entry.merge!(word_count: word_count)  # Add word count to the entry
      word_count <= 5
    end
    .sort_by { |entry| entry[:points] }
    .reverse

    stored_entries = []

    filtered_entries.each do |filtered_entry|
      # stored_entries << ScrapedEntry.create(number: filtered_entry[:number], title: filtered_entry[:title], points: filtered_entry[:points], comments: filtered_entry[:comments], timestamp: Time.now, filter: "filtered_by_points")
			stored_entry = ScrapedEntry.create(number: filtered_entry[:number], title: filtered_entry[:title], points: filtered_entry[:points], comments: filtered_entry[:comments], timestamp: Time.now, filter: "filtered_by_points")
      stored_entries << stored_entry.attributes.merge(word_count: filtered_entry[:word_count])  # Include word_count in the stored entry
    end

    render json: { message: "Filtered entries with less than or equal to five words in the title ordered by points", filtered_data: stored_entries }
  end

  private

  def scrape_entries
    url = "https://news.ycombinator.com/"
    html_content = URI.open(url).read
    doc = Nokogiri::HTML(html_content)
    scraped_entries = []  # Array to hold scraped entries

    doc.css(".athing").first(30).each do |entry|
      number = entry.css(".rank").text.to_i
      title = entry.css(".title").css("a").first.text
      points = entry.next_element.css(".score").text.to_i
      comments = entry.next_element.css("a").last.text.to_i

      scraped_entries << { number: number, title: title, points: points, comments: comments, timestamp: Time.now, filter: "no_filter" }
    end
    @scraped_data = scraped_entries  # Store scraped data in @scraped_data
  end

  def count_words(title)

		title.scan(/\b[\w'-]+\b/).size
  end
end
