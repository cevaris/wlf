class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user and user.account
      account = user.account

      super_admin = AccountRole.get(:super_admin)
      admin = AccountRole.get(:admin)
      basic = AccountRole.get(:basic)

      if account.account_role == super_admin
        can :manage, :all
      elsif account.account_role == admin
        can :manage, User, id: user.id
        can :manage, Account, id: all
        can :manage, Address, :all

        can :manage, Event, :all
        can :manage, EventSubmission, :all
      elsif account.account_role == basic
        # Donors, Sponsors
        can :manage, User, :id => user.id
        can :manage, Account, :id => account.id
        can :read, Event
        can :manage, EventSubmission, id: EventSubmission.where(account_id: account.id).ids
      end

      can :create, EventSubmission

    end
  end
end
