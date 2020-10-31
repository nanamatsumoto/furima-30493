class Item < ApplicationRecord
  has_one_attached :image
  # Active_hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date

  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :price, presence: true
  validates :region_id, presence: true
  validates :shipping_date_id, presence: true
  validates :user_id, presence: true
end
