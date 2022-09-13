class Test < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: { :scope => :level }

  validates :level, presence: true,
                    numericality: { only_integer: true }, allow_nil: true

  belongs_to :category
  belongs_to :author, class_name: :Admin, foreign_key: :user_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :joins_category, ->(name) { joins(:category).where(categories: {title: name}) }
  scope :active, -> { where(active: true) }

  def self.tests_by_category(name)
    self.joins_category(name).order(title: :asc).pluck(:title)
  end

  def activated?
    self.active == true
  end
end
