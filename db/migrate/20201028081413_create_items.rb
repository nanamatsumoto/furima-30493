class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :category_id     , null: false
      t.integer    :condition_id     , null: false
      t.integer    :postage_id     , null: false
      t.integer    :price     , null: false
      t.integer    :region_id     , null: false
      t.integer    :shipping_date_id     , null: false
      t.integer    :user_id       , null: false
      t.timestamps
    end
  end
end
