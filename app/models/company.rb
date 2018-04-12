class Company < ApplicationRecord
  has_many :users, as: :account
  has_many :projects
  has_many :contracts, through: :projects
  has_many :schools, through: :contracts

  before_save :titleize_name
  before_update :titleize_name
  before_create :titleize_name

  def titleize_name
    if self.name
      self.name = self.name.split('-').map(&:titleize).join('-')
    end
  end
end
