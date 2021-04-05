class Problem < ApplicationRecord
  has_many :problem_users
  has_many :users, through: :problem_users

  validates :title,   presence: true
  validates :content, presence: true
end
