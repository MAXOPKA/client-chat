class Ability
  include CanCan::Ability

  def initialize(u)
    u ||= User.new
    send(u.role) if roles.include? u.role
    user if u.role.nil?
  end

  private

  def admin
    can :manage, :all
  end

  def manager
    can [:read, :create, :update], user
  end

  def client

  end

  def user
    can :main, :index
  end

  def roles
    ["admin", "manager", "client"]
  end

end