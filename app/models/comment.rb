class Comment < ApplicationRecord
  belongs_to :problem
  belongs_to :user

  validates :solution, presence: true
end
