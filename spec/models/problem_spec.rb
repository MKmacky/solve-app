require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    @problem = FactoryBot.build(:problem)
  end
  
  describe 'お悩み投稿' do
    
    context '投稿できるとき' do

      it 'すべて存在すれば登録できる' do
        expect(@problem).to be_valid
      end

    end

    context '投稿できないとき' do

      it 'titleが空では登録できない' do
        @problem.title = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では登録できない' do
        @problem.content = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが0なら登録できない' do
        @problem.category_id = 0
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Category must be other than 0")
      end

    end
  end
end
