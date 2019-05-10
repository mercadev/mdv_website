class CreateScrapings < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapings do |t|
      t.string :source
      t.integer :nb_items
      t.string :status

      t.timestamps
    end
  end
end
