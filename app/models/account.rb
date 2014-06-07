class Account < ActiveRecord::Base
  has_one :user
  validates :plan, inclusion: { in: %w(free paid),
        message: "%{value} is not a valid plan" }

  def role?(base_role)
    self.plan == base_role.to_s
  end
end
