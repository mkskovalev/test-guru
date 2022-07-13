class Test < ApplicationRecord
  validates :title, :level, presence: true

  has_one :category
  has_many :questions

  def self.tests_by_category(title)
    Test.all.where(category_id: Category.find_by(title: title).id).order(id: :desc)
  end
end
