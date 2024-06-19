Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'scrape_data', to: 'scraped_entries#scrape_data'
  # Defines the root path route ("/")
  # root "articles#index"
end
