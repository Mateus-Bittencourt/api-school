class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # if self.user.kind == 'student'
  #   has_many :subscriptions
  #   has_many :courses, through: :subscriptions
  #   has_many :lectures, through: :courses
  # else
  #   has_many :courses
  #   has_many :lectures, through: :courses
  # end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :kind, inclusion: { in: %w[teacher student] }
end
