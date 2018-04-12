class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :account_type, :account_id, :email, :first_name, :last_name
  
  # belongs_to :account, polymorphic: true
  # has_many :technologies
  # has_many :contracts
end
