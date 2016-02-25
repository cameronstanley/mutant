class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :spotify_id
      t.text :spotify_user
      t.timestamps null: false
    end
  end
end
