class AddStatusToSightings < ActiveRecord::Migration[7.1]
  def change
    add_column :sightings, :status, :boolean, default: false
  end
end
