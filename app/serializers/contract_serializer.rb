class ContractSerializer
  include FastJsonapi::ObjectSerializer
  set_type :contract
  set_id :id
  attributes :fee, :start_time, :deadline, :github
  attribute :status do |obj|
    {
      is_requested: obj.is_requested,
      is_accepted: obj.is_accepted,
      is_in_progress: obj.is_in_progress,
      is_in_review: obj.is_in_review,
      is_completed: obj.is_completed
    }
  end
  attribute :school do |obj|
    {
      name: obj.school.name
    }
  end
  attribute :project do |obj|
    {
      name: obj.project.name
    }
  end

  belongs_to :school
  belongs_to :project
  belongs_to :user
  has_many :technologies
end
