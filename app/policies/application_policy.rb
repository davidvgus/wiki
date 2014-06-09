class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    if record.private
      record.owner == user || record.collaborators.include?(user)
    else
      user.present?
    end
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && record.owner == user
  end

  def scope
    record.class
  end
end

