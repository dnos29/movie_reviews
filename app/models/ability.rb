class Ability
  include CanCan::Ability

  def initialize(user)
    # actions =[]
    # controllers=[]
    p= Hash.new
    user.roles.each do |role|
      p["#{role.name}"] = role.ctrl
    end
    if user.user_group.name =="admin"
      can :manage, :all
    else
      can :"#{p.keys.first}", Movie
    end
  end
end
