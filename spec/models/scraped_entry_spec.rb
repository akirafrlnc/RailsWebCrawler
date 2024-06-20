     # spec/models/scraped_entry_spec.rb
     require 'rails_helper'

     RSpec.describe ScrapedEntry, type: :model do
       it 'validates the presence of title' do
         scraped_entry = ScrapedEntry.new(title: nil)
         expect(scraped_entry).not_to be_valid
       end
     end
