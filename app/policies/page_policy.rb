class PagePolicy < ApplicationPolicy

  def set_collaborators?
    user.present?
  end
end
