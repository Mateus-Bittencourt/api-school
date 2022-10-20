class Student < User
  default_scope -> { where(kind: 'student') }

  has_many :subscriptions, foreign_key: :user_id
  has_many :courses, through: :subscriptions

  has_many :lectures, through: :courses
end
