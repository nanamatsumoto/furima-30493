class Form
  include ActiveModel::Model
  attr_accessor :post_code,:prefectures_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :prefectures_id
    validates :city
    validates :house_number
    # validates :building_name
    validates :phone_number
    validates :user_id
    validates :item_id
    # validates :purchase
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
