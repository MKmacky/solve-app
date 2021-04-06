class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,        presence: true
  validates :password,    presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }
  validates :gender,      presence: true
  validates :age_id,      numericality: { other_than: 0 }
  validates :position_id, numericality: { other_than: 0 }

  has_many :problems
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :position
end
