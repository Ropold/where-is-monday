class CreateCats < ActiveRecord::Migration[7.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.string :race
      t.string :eye_color
      t.string :color
      t.string :fur
      t.boolean :found, default: false
      t.references :user, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
