class CreateBuyAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_addresses do |t|
      t.string :post_code,      null: false
      t.integer :address_id,    null: false
      t.string :city,           null: false
      t.string :city_number,    null: false
      t.string :building_name,  null: false
      t.string :phone_number,   null: false
      t.references :user_buy_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
