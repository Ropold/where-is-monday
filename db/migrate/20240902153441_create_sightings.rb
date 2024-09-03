class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|
      t.float :longitude
      t.float :latitude
      t.datetime :last_seen_at
      t.text :description
      t.string :address
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
