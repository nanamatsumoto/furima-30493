class Form
  include ActiveModel::Model
  attr_accessor :post_code,:prefectures_id, :city, :house_number, :building_name, :phone_number, :purchase

  # ここにバリデーションの処理を書く
  with options presence: true do
    validates :post_code
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
    validates :user_id
  end
  validates :purchase

  belongs_to :purchase

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase:purchase, user_id: user.id)
    # 各テーブルにデータを保存する処理を書く
  end
end
