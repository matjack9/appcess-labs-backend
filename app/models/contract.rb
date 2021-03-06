class Contract < ApplicationRecord
  belongs_to :school
  belongs_to :project
  belongs_to :user, optional: true

  validates :school_id, uniqueness: { scope: :project_id }

  after_save :set_times, if: :will_save_change_to_is_accepted?

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
