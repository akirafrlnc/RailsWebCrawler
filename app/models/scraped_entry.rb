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
	# Add validations
	validates :number, presence: true, numericality: { only_integer: true }
	validates :title, presence: true
	validates :points, presence: true, numericality: { only_integer: true }
	validates :comments, presence: true, numericality: { only_integer: true }
end
