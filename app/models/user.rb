class User < ApplicationRecord
  validates :name, :email, :password, :role, presence: true

  has_many :completed_tests

  def completed_tests(level)
    CompletedTest.all.where(user_id: self.id).where(test_id: Test.find_by(level: level).id)
  end
end
