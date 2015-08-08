class Ability
  include CanCan::Ability

  def initialize u
    unless u.nil?
      self.send(u.role)
    else
      self.user
    end
  end

  protected

  def admin
    can :manage, :all
  end

  def manager
    can [:read, :create, :update], User
  end

  def client

  end

  def user
    can [:new, :create], UserSession
  end

end
