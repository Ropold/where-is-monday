class AddCityToSightings < ActiveRecord::Migration[7.1]
  def change
    add_column :sightings, :city, :string
  end
end
