class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :address
      t.string :phone_number
      t.string :station
      t.integer :parking_id
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :url
      t.timestamps
    end
  end
end
