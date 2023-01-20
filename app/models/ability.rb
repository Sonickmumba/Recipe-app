class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:

    user ||= User.new

    can :read, Recipe do |recipe|
      recipe.user == user || recipe.public
    end

    can [:update, :destroy], Recipe do |recipe|
      recipe.user == user
    end

    can :manage, Food, user
  end
end
