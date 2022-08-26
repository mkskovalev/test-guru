class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists, foreign_key: :user_id, dependent: :destroy

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end
