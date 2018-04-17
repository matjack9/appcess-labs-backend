class CompanySerializer
  include FastJsonapi::ObjectSerializer
  set_type :company
  set_id :id
  attributes :name, :website, :description, :key, :admin_key
end
