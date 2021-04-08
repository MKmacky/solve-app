require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規投稿' do
    context '新規登録できるとき' do
      it 'すべて存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが8文字以上であれば登録できる' do
        @user.password = '1234abcd'
        @user.password_confirmation = '1234abcd'
        expect(@user).to be_valid
      end

      it 'passwordが英数字混合であれば登録できる' do
        @user.password = '1234abcd'
        @user.password_confirmation = '1234abcd'
        expect(@user).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end

      it 'passwordが8文字以下なら登録できない' do
        @user.password = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'genderが空では登録できない' do
        @user.gender = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
      end

      it 'age_idが0では登録できない' do
        @user.age_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('Age must be other than 0')
      end

      it 'position_idが0では登録できない' do
        @user.position_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('Position must be other than 0')
      end
    end
  end
end
