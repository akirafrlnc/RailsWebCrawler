# spec/factories/scraped_entries.rb
FactoryBot.define do
  factory :scraped_entry do
    sequence(:number) { |n| n }
    title { Faker::Lorem.sentence }
    points { Faker::Number.between(from: 1, to: 100) }
    comments { Faker::Number.between(from: 0, to: 50) }
    # Add more attributes as needed
  end
end
