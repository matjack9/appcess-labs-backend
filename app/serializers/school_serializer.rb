class SchoolSerializer
  include FastJsonapi::ObjectSerializer
  set_type :school
  set_id :id
  attributes :name, :website, :fee, :turntime

  # has_many :users, as: :account
  # has_many :contracts
  # has_many :projects
  # has_many :companies
  # has_many :technologies
end
