class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def question_title
    self.question.body.slice(0..24)
  end

  def hash_title
    hash = self.url.split('/').last
  end
end
