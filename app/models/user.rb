class User < ApplicationRecord
  validates :name, :email, :password, :role, presence: true

  has_many :completed_tests

  def completed_tests_by_level(level)
    CompletedTest.joins('INNER JOIN users ON completed_tests.user_id = users.id
                         INNER JOIN tests ON completed_tests.test_id = tests.id')
                         .where(tests: {level: level})
                         .where(users: {id: self.id}).pluck(:title)
  end
end
