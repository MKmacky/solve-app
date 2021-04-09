require 'rails_helper'

RSpec.describe "ルーム削除機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @problem = FactoryBot.create(:problem, user_id: @user.id)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    sign_in(@user)
    click_on(@problem.title)
    FactoryBot.create_list(:comment, 5, problem_id: @problem.id, user_id: @user.id)
    expect {
      find_link('お悩み解決',  href: problem_path(@problem)).click
    }.to change { @problem.comments.count }.by(-5)
    expect(current_path).to eq(root_path)
  end
  
end
