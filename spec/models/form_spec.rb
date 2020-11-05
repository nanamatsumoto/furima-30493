require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end
  
  it "全てが入力されていたら保存ができること" do
    expect(@form).to be_valid
  end

  it "post_codeが空では保存ができないこと" do
    @form.post_code = ""
    @form.valid?
    expect(@form.errors.full_messages).to include("Post code can't be blank")
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

  it "building_nameが空では保存ができないこと" do
    @form.building_name = ""
    @form.valid?
    expect(@form.errors.full_messages).to include("Building name can't be blank")
  end

  it "phone_numberが空では保存ができないこと" do
    @form.building_name = ""
    @form.valid?
    expect(@form.errors.full_messages).to include("Building name can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @form.token = nil
    @form.valid?
    expect(@form.errors.full_messages).to include("Token can't be blank")
  end
end
