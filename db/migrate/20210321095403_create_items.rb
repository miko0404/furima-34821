class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
       t.integer :item_name,            null: false
       t.text :item_explanation,        null: false
       t.integer :category_id,          null: false
       t.integer :item_status_id,       null: false
       t.integer :postage_payer_id,     null: false
       t.integer :days_shipping_id,     null: false
       t.integer :exhibition_price,     null: false
       t.references :user,              null: false, foreign_key: true 
       t.integer :address_id,           null: false
       t.timestamps
    end
  end
end
