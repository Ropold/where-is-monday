class AddCityToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :city, :string
  end
end
