FactoryBot.define do
  factory :item do
    name             { 'オムライス' }
    explanation      { 'おいしいです。' }
    category_id      { 2 } 
    quality_id       { 2 }  
    who_pay_id       { 2 }  
    delivery_area_id { 2 } 
    delivery_day_id  { 2 }  
    price            { 300 } 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end

end
