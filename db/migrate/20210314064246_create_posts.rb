class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :ec_url
      t.text :delivery_url
      t.integer :prefecture_id
      t.integer :genre_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
