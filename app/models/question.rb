class Question < ApplicationRecord
  validates :body, presence: true,
                   uniqueness: true

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question_id, dependent: :destroy
  has_many :gists, dependent: :destroy
end
