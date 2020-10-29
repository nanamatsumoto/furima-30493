class Item < ApplicationRecord
  has_one_attached :image

  validates :item_image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  
end
