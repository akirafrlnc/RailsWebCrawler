# app/models/news_data_entry.rb
class ScrapedEntry < ApplicationRecord
  # Fields for storing extracted data
  attribute :number, :integer
  attribute :title, :string
  attribute :points, :integer
  attribute :comments, :integer

  # Fields for storing usage data
  attribute :timestamp, :datetime
  attribute :filter, :string
end
