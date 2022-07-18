class Answer < ApplicationRecord
  validates :body, presence: true
  validate :validate_count_in_test

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  def validate_count_in_test
    errors.add(:answers_count, "it should be 1-4 answers for question") if self.question.answers.count > 3
  end
end
