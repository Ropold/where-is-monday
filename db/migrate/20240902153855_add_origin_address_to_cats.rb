class AddOriginAddressToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :origin_address, :string
    add_column :cats, :origin_longitude, :float
    add_column :cats, :origin_latitude, :float
  end
end
