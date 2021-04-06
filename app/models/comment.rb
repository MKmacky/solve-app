class Comment < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_one_attached :image

  validates :solution, presence: true
end
