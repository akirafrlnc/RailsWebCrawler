Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'test', to: 'scraped_entries#test'
  get 'scrape_data', to: 'scraped_entries#scrape_data'
	get 'filter_by_title_length_and_comments', to: 'scraped_entries#filter_by_title_length_and_comments'
  get 'filter_by_title_length_and_points', to: 'scraped_entries#filter_by_title_length_and_points'
  # Defines the root path route ("/")
  # root "articles#index"
end
