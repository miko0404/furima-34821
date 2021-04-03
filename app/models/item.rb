class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage_payer
  belongs_to :days_shipping
  belongs_to :address
  belongs_to :item_status
  belongs_to :user
  #belongs_to :address_id
  has_one_attached :image
  has_one :user_buy_address

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_explanation
    validates :exhibition_price 
    with_options numericality: { other_than: 1 } do
      validates :item_status_id
      validates :category_id
      validates :postage_payer_id
      validates :days_shipping_id
      validates :address_id 
    end

    validates :exhibition_price, numericality: { greater_than: 300, less_than:9999999 }, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: '半角数字を使用してください'}
  end
end
