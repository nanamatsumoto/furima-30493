FactoryBot.define do
  factory :form do
    
    post_code {123-4567}
    prefectures_id {2}
    city {"aあア"}
    house_number {"aあア"}
    building_name {"aあア"}
    phone_number {11111111111}
    user_id {1}
    item_id {1}
    purchase {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
