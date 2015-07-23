class CreateFavoriteships < ActiveRecord::Migration
  def change
    create_table :favoriteships do |t|
      t.integer :user_id
      t.integer :favorite_id

      t.timestamps null: false
    end
  end
end
