require "open-uri"
require "sanitize"

class ScrapedEntriesController < ApplicationController
  def scrape_data
    url = "https://news.ycombinator.com/"
    html_content = URI.open(url).read
    doc = Nokogiri::HTML(html_content)

    scraped_data = []

    doc.css(".athing").first(30).each do |entry|
      number = entry.css(".rank").text.to_i
      title = entry.css(".title").css("a").first.text
      points = entry.next_element.css(".score").text.to_i
      comments = entry.next_element.css("a").last.text.to_i
			
      scraped_entry = ScrapedEntry.create(number: number, title: title, points: points, comments: comments, timestamp: Time.now, filter: "sample_filter")
      scraped_data << scraped_entry
    end

    render json: { message: "Data scraped and saved successfully", scraped_data: scraped_data }
  end
end
