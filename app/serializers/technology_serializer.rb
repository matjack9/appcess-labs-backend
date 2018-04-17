class TechnologySerializer
  include FastJsonapi::ObjectSerializer
  set_type :technology
  set_id :id
  attributes :name
end
