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
      p.map do |key,value|
        can :"#{key}", "#{value}".constantize
      end
    end
  end
end
