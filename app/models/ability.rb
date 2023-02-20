# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize( user )
    if user.is? :admin
      can :manage, :all
    else
      can :destroy, Comment, author_id: user.id
    end
  end
end
