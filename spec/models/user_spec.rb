require 'rails_helper'
RSpec.describe 'ユーザー新規登録', type: :model do
  describe User do
      before do
        @user = FactoryBot.build(:user)
      end

      describe 'ユーザー新規登録' do
        it "ニックネームがない場合、無効である" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "メールアドレスがない場合、無効である" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "メールアドレスが一意性でない場合、無効である" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "メールアドレスは、＠を含む必要があること" do
          @user.email = "nnn@gmail.com"
          @user.valid?
          expect(@user).to be_valid
        end

        it "emailの前に文字がないと無効" do
          @user.email =  "nnn@"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "パスワードが必須である" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "姓がない場合、無効である" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "名がない場合、無効である" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
  
        it "誕生日がない場合、無効である" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end

        it "姓(カナ)が入力されていない場合無効" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it "名(カナ)が入力されていない場合無効" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "パスワードは、6文字以上での入力が必須である" do
          @user.password = "nnnn11"
          @user.valid?
          expect(@user).to be_valid
        end

        it "パスワードが5文字以下なら無効" do
          @user.password = "nnnn11"
          @user.valid?
        end

        it "全ての値が揃っている時に保存できる" do
          expect(@user).to be_valid
        end

        it "パスワードは、半角英数字混合での入力でない場合、無効である" do
          @user.password = "nnnnnn"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "パスワードとパスワード（確認用）、不一致では登録できない" do
          @user.password = "nnnn11"
          @user.password_confirmation = "nnnn111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end