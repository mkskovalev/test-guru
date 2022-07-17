class Answer < ApplicationRecord
  validates :body, presence: true
  validate :validate_answers_count

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    errors.add(:answers_count, "it should be 1-4 answers for question") if (1..4).exclude?(self.question.answers.count)
  end
end
