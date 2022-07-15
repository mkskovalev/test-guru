class Test < ApplicationRecord
  validates :title, :level, presence: true

  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :id
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_by_category(name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: name}).pluck(:title)
  end
end
