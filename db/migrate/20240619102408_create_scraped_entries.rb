class CreateScrapedEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :scraped_entries do |t|
      t.integer :number
      t.string :title
      t.integer :points
      t.integer :comments
      t.datetime :timestamp
      t.string :filter

      t.timestamps
    end
  end
end
