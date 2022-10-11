class Lecture < ApplicationRecord
  belongs_to :course
  has_one :user, through: :course # techaer
  has_many :subscriptions, through: :course
  has_many :users, through: :subscriptions # students

  validates :title, :content, presence: true
end
