FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    delivery_area_id { 2 } 
    city { '渋谷区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token {'tok_abcdefghijk00000000000000000'}
  end
end
