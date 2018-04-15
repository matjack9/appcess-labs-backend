class Project < ApplicationRecord
  belongs_to :company
  has_many :contracts
  has_many :schools, through: :contracts

  validates :name, presence: true
  validates :name, uniqueness: { scope: :company_id }
  validates :description, presence: true
  validates :user_stories, presence: true
  validates :requirements, presence: true

  before_validation :titleize_name

  def titleize_name
    self.name = self.name.split('-').map(&:titleize).join('-')
  end
end
