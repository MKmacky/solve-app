class Problem < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title,   presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 0 }
  
end
