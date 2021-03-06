class Test < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: { :scope => :level }

  validates :level, presence: true,
                    numericality: { only_integer: true }, allow_nil: true

  belongs_to :category
  belongs_to :author, class_name: :User
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :joins_category, ->(name) { joins(:category).where(categories: {title: name}) }

  def self.tests_by_category(name)
    self.joins_category(name).order(title: :asc).pluck(:title)
  end
end
