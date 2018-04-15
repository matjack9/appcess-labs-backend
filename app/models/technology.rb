class Technology < ApplicationRecord
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :users
  has_many :contracts, through: :schools

  validates :name, presence: true
  validates :name, uniqueness: true

  before_validation :downcase_name

  def downcase_name
    self.name = self.name.downcase
  end
end
