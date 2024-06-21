# spec/controllers/scraped_entries_controller_spec.rb
require "rails_helper"
require "pry"
# test the scrape_entries function
RSpec.describe ScrapedEntriesController, type: :controller do
  describe "#scrape_entries" do
    it "scrapes first 30 data from Hacker News with Nokogiri " do
      controller = ScrapedEntriesController.new
      controller.send(:scrape_entries)  # Call the private method using send

      # Check if the URL is correctly set
      expect(controller.instance_variable_get(:@url)).to eq("https://news.ycombinator.com/")

      # Check if Nokogiri is working properly
      expect(controller.instance_variable_get(:@doc)).to be_instance_of(Nokogiri::HTML::Document)

      # Check if scraped_data has the first 30 entries
      expect(controller.instance_variable_get(:@scraped_data).size).to eq(30)
    end
  end
end
# test the scrape_data function
RSpec.describe ScrapedEntriesController, type: :controller do
  describe "POST #scrape_data" do
    it "creates scraped entries and returns success message" do
      post :scrape_data
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["message"]).to eq("Data scraped and saved successfully")
    end
  end
end

# test the filter_by_title_length_and_comments function

RSpec.describe ScrapedEntriesController, type: :controller do
  describe "POST #filter_by_title_length_and_comments" do
    it "filters entries by word count and comments, and creates data successfully" do
      post :filter_by_title_length_and_comments

      expect(response).to have_http_status(:success)

      filtered_entries = controller.instance_variable_get(:@filtered_entries)
      expect(filtered_entries).not_to be_empty

      # Check if entries have word count greater than 5
      filtered_entries.each do |entry|
        expect(controller.send(:count_words, entry[:title])).to be > 5
      end

      # Test if filtered_entries are sorted by comments in descending order
      sorted_by_comments = filtered_entries.each_cons(2).all? { |a, b| a[:comments] >= b[:comments] }
      expect(sorted_by_comments).to be true

      # Check if data creation is successful
      stored_entries = controller.instance_variable_get(:@stored_entries)
      expect(stored_entries).not_to be_empty
    end
  end
end

# test
RSpec.describe ScrapedEntriesController, type: :controller do
  describe "POST #filter_by_title_length_and_points" do
    it "filters entries by word count and points, and creates data successfully" do
      post :filter_by_title_length_and_points

      expect(response).to have_http_status(:success)

      filtered_entries = controller.instance_variable_get(:@filtered_entries)
      expect(filtered_entries).not_to be_empty
      # Check if entries have word count greater than 5
      filtered_entries.each do |entry|
        expect(controller.send(:count_words, entry[:title])).to be <= 5
      end

      # Test if filtered_entries are sorted by comments in descending order
      sorted_by_points = filtered_entries.each_cons(2).all? { |a, b| a[:points] >= b[:points] }
      expect(sorted_by_points).to be true

      # Check if data creation is successful
      stored_entries = controller.instance_variable_get(:@stored_entries)
      # binding.pry # Execution will pause here
      expect(stored_entries).not_to be_empty
    end
  end
end
