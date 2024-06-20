# spec/controllers/scraped_entries_controller_spec.rb
require "rails_helper"

RSpec.describe ScrapedEntriesController, type: :controller do
  describe "POST #scrape_data" do
    it "returns a success response" do
      post :scrape_data
      expect(response).to be_successful
    end
  end
end

# filter_by_title_length_and_comments
RSpec.describe ScrapedEntriesController, type: :controller do
  describe 'POST #filter_by_title_length_and_comments' do
    it 'filters entries by title length and comments' do
      # Create mock scraped data using FactoryBot
      scraped_data = FactoryBot.create_list(:scraped_entry, 5, title: 'This is a long title', comments: 10)
      scraped_data << FactoryBot.create(:scraped_entry, title: 'Short title', comments: 3)

      # Stub the scrape_entries method to return the mock data
      allow(controller).to receive(:scrape_entries).and_return(scraped_data)

      post :filter_by_title_length_and_comments

      expect(response).to be_successful  # Check if the response is successful
      expect(assigns(:filtered_data).count).to eq(1)  # Expecting only one entry after filtering
      expect(assigns(:filtered_data).first[:title]).to eq('This is a long title')  # Expecting the long title entry
      expect(assigns(:filtered_data).first[:comments]).to eq(10)  # Expecting comments count of 10
    end
  end
end
