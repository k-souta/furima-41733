class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :post,  null: false
      t.integer :prefecture_id, null: false
      t.string :municipality,  null: false
      t.string :construction
      t.string :address, null: false
      t.string :phone, null: false
      t.references :order, null:false, foreign_key: true
      t.timestamps
    end
  end
end
