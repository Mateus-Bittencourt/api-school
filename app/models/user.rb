class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :courses

  # has_many :lectures, through: :courses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :kind, inclusion: { in: %w[teacher student] }
end
