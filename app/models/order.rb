class Order
    include ActiveModel::Model
    attr_accessor :post_code, :item_id, :address_id, :city, :city_number, :building_name, :phone_number, :user_id, :token
  
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :address_id, numericality: {other_than: 1, message: "can't be blank"}
      validates :token
      validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
      validates :city
      validates :city_number
      validates :phone_number, format: {with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/, message: "Input only number"}
    end
  
    def save
      user_buy_address = UserBuyAddress.create(user_id: user_id, item_id: item_id)
      BuyAddress.create(post_code: post_code, address_id: address_id, city: city, city_number: city_number, building_name: building_name, phone_number: phone_number, user_buy_address: user_buy_address)
    end
  end 