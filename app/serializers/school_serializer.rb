class SchoolSerializer
  include FastJsonapi::ObjectSerializer
  set_type :school
  set_id :id
  attributes :name, :website, :fee, :turntime, :image_url, :key, :admin_key
end
