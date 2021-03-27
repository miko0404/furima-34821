class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item
      
  with_options presence: true do
    validates :password, format: { with: /\A[a-z0-9]{6,}+\z/i, message: 'is invalid. Input half-width characters.' }
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
      
