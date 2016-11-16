class Ability
  include CanCan::Ability

  def initialize(user)
    hash =[]
    user.roles.each do |role|
      hash.push(role.name)
    end
    if user.user_group.name =="admin"
      can :manage, :all
    else
      can hash, Movie
    end
  end
end
