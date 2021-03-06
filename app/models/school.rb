class School < ApplicationRecord
  has_many :users, as: :account
  has_many :contracts
  has_many :projects, through: :contracts
  has_many :companies, through: :projects

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :website, presence: true
  validates :fee, presence: true
  validates :turntime, presence: true
  validates :key, presence: true
  validates :admin_key, presence: true

  before_validation :titleize_name

  def titleize_name
    self.name = self.name.split('-').map(&:titleize).join('-')
  end

  def fee_float
    self.fee.to_f
  end
end
