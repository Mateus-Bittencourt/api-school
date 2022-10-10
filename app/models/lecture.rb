class Lecture < ApplicationRecord
  belongs_to :course

  validates :title, :content, presence: true
end
