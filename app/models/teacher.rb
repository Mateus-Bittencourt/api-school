class Teacher < User
  default_scope -> { where(kind: 'teacher') }

  has_many :courses, foreign_key: :user_id

  has_many :lectures, through: :courses
end
