class User < ActiveRecord::Base
  has_many :activites, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :subjects, through: :user_subjects
  has_many :tasks, through: :user_tasks

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  enum role: [:admin, :supervisor, :trainee]
end
