class CompanySerializer
  include FastJsonapi::ObjectSerializer
  set_type :company
  set_id :id
  attributes :name, :website, :description

  # has_many :users, as: :account
  # has_many :projects
  # has_many :contracts
  # has_many :schools
end
