class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.hstore :spotify_user

      t.timestamps null: false
    end
  end
end
