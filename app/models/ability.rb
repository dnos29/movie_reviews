class Ability
  include CanCan::Ability

  def initialize(user)
    p= Hash.new
    user.roles.each do |role|
      p["#{role.name}"] = role.ctrl
    end
    ug = user.user_group
    ug.roles.each do |role|
      p["#{role.name}"] = role.ctrl
    end
    p.map do |key, value|
      can :"#{key}", "#{value}".constantize
    end
  end
end
