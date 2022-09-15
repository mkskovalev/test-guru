class Badge < ApplicationRecord

  has_many :rewards, dependent: :destroy
  has_many :users, through: :rewards

  validates :title, presence: true,
                    uniqueness: true

  validates :image, :rule, :sub_rule, presence: true

  enum rule: { completed_tests_by_category: 1,
               completed_tests_by_level: 2,
               passed_test_from_very_first_time: 3 }

end
