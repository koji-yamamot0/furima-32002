class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                  null: false
      t.integer :category_id,           null: false
      t.text :text,                     null: false
      t.integer :price,                 null: false
      t.references :user,               foreign_key: true
      t.integer :delivery_fee_id,       null: false
      t.integer :ship_from_location_id, null: false
      t.integer :shipping_date_id,      null: false
      t.integer :item_status_id,        null: false
      t.integer :favorite
      t.timestamps
    end
  end
end
