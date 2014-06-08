class PagePolicy < ApplicationPolicy

  def set_collaborators?
    user.present? && record.owner == user
  end
end
