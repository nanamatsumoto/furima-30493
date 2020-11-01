require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品登録' do

      it "全ての項目への入力が必須" do
        expect(@item).to be_valid
      end

      it "商品画像がない場合無効" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品の説明がない場合無効" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it "カテゴリーの情報がない場合無効" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態についての情報がない場合無効" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it "配送料の負担についての情報がない場合無効" do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end

      it "発送元の地域についての情報がない場合無効" do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 0")
      end

      it "発送までの日数についての情報がない場合無効" do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end

      it "価格についての情報がない場合無効" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格は半角数字のみ保存が可能" do
        @item.price = "350"
        @item.valid?
        expect(@item).to be_valid
      end

      it "価格が300円未満なら無効" do
        @item.price = 300
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      
      it "価格が9999999円以上なら無効" do
        @item.price = 9999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
