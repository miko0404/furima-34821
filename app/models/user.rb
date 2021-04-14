class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :user_buy_addresses
  has_many :comments 
      
  with_options presence: true do
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'is invalid. Input half-width characters.' }
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :last_name
    validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー-ー]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :last_name_kana
      validates :first_name_kana
    end
 end
end
      
