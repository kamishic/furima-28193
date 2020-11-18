class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,null:false
      t.text :description,null:false
      t.integer :status_id,null:false
      t.integer :category_id,null:false
      t.integer :cost_ship_id,null:false
      t.integer :day_to_ship_id,null:false
      t.integer :area_from_ship_id,null:false
      t.integer :price,null:false
      t.references :user,null:false,foreign_key:true
      t.timestamps
    end
  end
end
