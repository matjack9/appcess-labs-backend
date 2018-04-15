class Contract < ApplicationRecord
  belongs_to :school
  belongs_to :project
  belongs_to :user, optional: true
  has_and_belongs_to_many :technologies

  validates :school_id, uniqueness: { scope: :project_id }

  before_update :set_times, if: :is_accepted_changed?

  def fee_float
    self.fee.to_f
  end

  def set_times
    self.update(start_time: DateTime.now)
    turntime = self.school.turntime
    deadline = self.start_time + turntime.days
    self.update(deadline: deadline)
  end
end
