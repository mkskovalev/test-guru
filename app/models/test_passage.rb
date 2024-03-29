class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  scope :completed, -> { where(completed: true) }

  SUCCESS_RATE = 85
  SECONDS_IN_MINUTE = 60

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed_successfuly
    update_column(:completed, true)
  end

  def success?
    unless self.expired?
      questions_count = self.test.questions.count.to_f
      ((self.correct_questions / questions_count) * 100).round(0) >= SUCCESS_RATE
    end
  end

  def question_count
    self.test.questions.where("id <= ?", self.current_question.id).count
  end

  def expired?
    Time.now.to_i > end_time
  end

  def end_time
    (self.created_at + (self.test.time * SECONDS_IN_MINUTE)).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
