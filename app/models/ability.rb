# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Task, owner_id: user.id
    can :read, Task, participating_users: { user_id: user.id }
    
    # * si el usuario es propietario del post puede escribir notas
    can :create, Note do |n|
      # obtener el propietario de la tarea
      owner_id = Task.find(n.task_id).owner_id
      # comparo si el current user es propietario de la tarea
      owner_id == user.id
    end
  end

  

end
