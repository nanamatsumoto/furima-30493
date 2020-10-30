class Item < ApplicationRecord
  has_one_attached :image
  # Active_hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date

  # validates :item_image, presence: true

  # validates :item_info, presence: true
  # validates :item_category
  # validates :item_sales_status
  # validates :item_shipping_fee_status
  # validates :item_prefecture
  # validates :item_scheduled_delivery
  # validates :item_price

  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :price_id, presence: true
  validates :region_id, presence: true
  validates :shipping_date_id, presence: true



end
