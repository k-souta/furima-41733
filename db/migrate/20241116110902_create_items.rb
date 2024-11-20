class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,   null:false
      t.integer :category_id, null:false
      t.integer :cost_id, null:false
      t.text    :item_explanation, null:false
      t.integer :cost_load_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :hidzuke_id, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
