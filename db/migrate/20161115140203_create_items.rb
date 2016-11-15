class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :material_category
      t.string :brand_name
      t.string :model
      t.integer :model_year
      t.integer :length
      t.string :segment
      t.string :skill_level
      t.float :price
      t.string :ski_station
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
