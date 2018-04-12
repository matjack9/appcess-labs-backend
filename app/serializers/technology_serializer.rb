class TechnologySerializer
  include FastJsonapi::ObjectSerializer
  set_type :technology
  set_id :id
  attributes :name

  # has_many :schools
  # has_many :users
  # has_many :contracts
end
