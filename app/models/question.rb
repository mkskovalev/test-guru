class Question < ApplicationRecord
  validates :body, presence: true
  validate :validate_answers_count

  belongs_to :test
  has_many :answers

  def validate_answers_count
    errors.add(:answers_count, "it should be 1-4 answers for question") if (0..4).exclude?(self.answers.count)
  end
end
