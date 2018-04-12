class User < ApplicationRecord
  belongs_to :account, polymorphic: true
  has_and_belongs_to_many :technologies
  has_many :contracts

  validates :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

  before_save :titleize_names
  before_update :titleize_names
  before_create :titleize_names

  def titleize_names
    self.first_name = self.first_name.split('-').map(&:titleize).join('-')
    self.last_name = self.last_name.split('-').map(&:titleize).join('-')
  end
end
