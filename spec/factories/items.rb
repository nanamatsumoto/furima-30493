FactoryBot.define do
  factory :item do
    
      title              {"aあア"}
      text               {"aあア"}
      category_id         {"1"}
      condition_id       {"1"}
      postage_id         {"1"}
      region_id          {"1"}
      shipping_date_id   {"1"}
      price              {350}

      association :user
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  
    end
  end
end
