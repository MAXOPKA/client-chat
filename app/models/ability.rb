class Ability
  include CanCan::Ability

  def initialize u
    can :manage, UserSession
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
    can [:read, :create, :update, :show], User
    can [:read, :create, :update, :show], Chat do |chat|

    end
  end

  def client

  end

  def user
    can [:new, :create], UserSession
  end

end
