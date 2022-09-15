class Admin < User

  has_many :authored_tests, class_name: :Test, foreign_key: :user_id
  has_many :badges, class_name: :Badge, foreign_key: :user_id

  validates :first_name, presence: true
  validates :last_name, presence: true
end
