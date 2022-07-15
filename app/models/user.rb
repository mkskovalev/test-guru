class User < ApplicationRecord
  validates :name, :email, :password, presence: true

  has_one :admin
  has_many :tests_users
  has_many :tests, through: :tests_users

  def completed_tests_by_level(level)
    Test.where(level: level)
        .joins('INNER JOIN completed_tests ON tests.id = completed_tests.test_id')
        .where(completed_tests: {user_id: self.id})
  end
end
