FactoryBot.define do
  factory :order do
    post_code         {'123-1234'}
    address_id        {2}
    city              {'横浜市'}
    city_number       {'1-1'}
    building_name     {''}
    phone_number      {'11111111111'}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end 