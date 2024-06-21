# spec/models/scraped_entry_spec.rb

require 'rails_helper'

RSpec.describe ScrapedEntry, type: :model do
  it "validates presence of attributes" do
    should validate_presence_of(:number)
    should validate_presence_of(:title)
    should validate_presence_of(:points)
    should validate_presence_of(:comments)
  end

  it "validates numericality of attributes" do
    should validate_numericality_of(:number).only_integer
    should validate_numericality_of(:points).only_integer
    should validate_numericality_of(:comments).only_integer
  end


  it "is valid with valid attributes" do
    scraped_entry = ScrapedEntry.new(
      number: 1,
      title: "Sample Title",
      points: 10,
      comments: 5
    )
    expect(scraped_entry).to be_valid
  end
end
