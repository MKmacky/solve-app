require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる' do
      it 'contentとimageが存在していれば保存できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できないとき' do
      it 'solutionが空でも保存できること' do
        @comment.solution = ''
        expect(@comment).to be_valid
      end

      it 'imageが空でも保存できる' do
        @comment.image = nil
        expect(@comment).to be_valid
      end

      it 'solutionとimageが空では保存できない' do
        @comment.solution = ''
        @comment.image = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Solution can't be blank")
      end

      it 'problemが紐付いていないと保存できない' do
        @comment.problem = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Problem must exist')
      end

      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end
  end
end
