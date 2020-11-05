require 'rails_helper'

RSpec.describe Form, type: :model do
  describe Form do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @form = FactoryBot.build(:form, item_id: @item.id, user_id: @user.id)
  end

    it "post_codeが空では保存ができないこと" do
      @form.post_code = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Post code can't be blank")
    end

    it "post_codeがハイフンなしでは保存ができないこと" do
      @form.post_code = "1234567"
      @form.valid?
      binding.pry
      expect(@form.errors.full_messages).to include("Post code is invalid")
    end

    it "prefectures_idが空では保存ができないこと" do
      @form.prefectures_id = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "cityが空では保存ができないこと" do
      @form.city = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空では保存ができないこと" do
      @form.house_number = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberが空では保存ができないこと" do
      @form.phone_number = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが数字のみかつ11桁でないと保存ができないこと" do
      @form.phone_number = "1111111111"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
    end

    it "prefectures_id番号は1では保存ができないこと" do
      @form.prefectures_id = 1
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it "prefectures_id番号は空では保存ができないこと" do
      @form.prefectures_id = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @form.token = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Token can't be blank")
    end

    it "全てが入力されていたら保存ができること" do
      expect(@form).to be_valid
    end
  end
end
