Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'scrape_data', to: 'scraped_entries#scrape_data'
	post 'filter_by_title_length_and_comments', to: 'scraped_entries#filter_by_title_length_and_comments'
  post 'filter_by_title_length_and_points', to: 'scraped_entries#filter_by_title_length_and_points'
  # Defines the root path route ("/")
  # root "articles#index"
end
