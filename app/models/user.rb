require 'digest/sha1'

class User < ApplicationRecord

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: :Test, foreign_key: :user_id

  has_secure_password

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
