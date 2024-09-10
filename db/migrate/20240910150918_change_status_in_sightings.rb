class ChangeStatusInSightings < ActiveRecord::Migration[7.1]
  def change
    change_column :sightings, :status, :string, default: "pending"
  end
end
