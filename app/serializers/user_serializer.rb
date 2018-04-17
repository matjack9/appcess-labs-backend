class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :account_type, :account_id, :email, :first_name, :last_name
end
