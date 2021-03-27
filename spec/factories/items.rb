FactoryBot.define do
  factory :item do

    item_name              { 'test' }
    item_explanation       { 'test' }
    exhibition_price       { 700 }
    category_id            { 2 }
    postage_payer_id       { 2 }
    days_shipping_id       { 2 }
    address_id             { 2 }
    item_status_id         { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
