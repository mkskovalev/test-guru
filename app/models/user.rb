class User < ApplicationRecord
  validates :name, :email, :password, :role, presence: true

  has_many :completed_tests

  def completed_tests_by_level(level)
    Test.where(level: level)
        .joins('INNER JOIN completed_tests ON tests.id = completed_tests.test_id')
        .where(completed_tests: {user_id: self.id})
  end
end
