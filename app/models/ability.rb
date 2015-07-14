class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(created_at: Time.now, admin: false)

    can :read, Comment
    can :create, Comment
    can [:update, :destroy], Comment, author_id: user.id
 
    if user.admin?
      can :manage, :all
    else
      can :read, :all 
    end

  end
end
