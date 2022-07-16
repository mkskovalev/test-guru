class Category < ApplicationRecord
  validates :title, presence: true

  has_many :tests

  default_scope { order(name: :asc) }
end
