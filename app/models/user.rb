class User < ApplicationRecord
  validates :name, :email, :password, presence: true

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :quiz, class_name: :Test, foreign_key: :user_id

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
