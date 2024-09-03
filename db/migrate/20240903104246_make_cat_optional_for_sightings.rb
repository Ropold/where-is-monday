class MakeCatOptionalForSightings < ActiveRecord::Migration[6.0]
  def change
    change_column_null :sightings, :cat_id, true
  end
end
