class AddStatusToSightings < ActiveRecord::Migration[7.1]
  def change
    add_column :sightings, :status, :boolean
  end
end
