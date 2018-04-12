class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_type :project
  set_id :id
  attributes :name, :description, :user_stories, :requirements

  belongs_to :company
  has_many :contracts
end
