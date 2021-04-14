require 'rails_helper'

RSpec.describe 'コメント投稿機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @problem = FactoryBot.create(:problem)
  end

  context '投稿に失敗したとき' do
    it 'コメントが空でメッセージの送信に失敗すること' do
      sign_in(@user)
      click_on(@problem.title)
      expect do
        find('input[name="commit"]').click
      end.not_to change { Comment.count }
      expect(current_path).to eq(problem_path(@problem.id))
    end
  end

  context '投稿に成功したとき' do
    it 'コメント投稿に成功すると、投稿一覧に遷移して投稿した内容が表示されている' do
      sign_in(@user)
      click_on(@problem.title)
      post = 'テスト'
      fill_in 'comment_solution', with: post
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(1)
      expect(current_path).to eq(problem_path(@problem.id))
      expect(page).to have_content(post)
    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      sign_in(@user)
      click_on(@problem.title)
      image_path = Rails.root.join('public/images/test_img.png')
      attach_file('comment[image]', image_path, make_visible: true)
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(1)
      expect(current_path).to eq(problem_path(@problem.id))
      expect(page).to have_selector('img')
    end
  end
end
