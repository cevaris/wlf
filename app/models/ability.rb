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
    Rails.logger.info "CANCAN START"
    if user and user.account
      Rails.logger.info(
        "CANCAN FOUND #{user.email} #{user.account.account_role.name}"
      )
      account = user.account

      super_admin = AccountRole.get(:super_admin)
      admin = AccountRole.get(:admin)
      basic = AccountRole.get(:basic)

      if account.account_role == super_admin
        Rails.logger.info "CANCAN FOUND SUPER ADMIN"
        can :manage, :all
      elsif account.account_role == admin
        Rails.logger.info "CANCAN FOUND ADMIN"
        # Web maintainers
        # can :manage, User, id: user.id
        # can :manage, Account
        # can :manage, Address

        # can :manage, Event
      # can :manage, EventSubmission
        can :manage, :all
      elsif account.account_role == basic
        Rails.logger.info "CANCAN FOUND BASIC USER"
        # Donors, Sponsors
        can :manage, User, :id => user.id
        can :manage, Account, :id => account.id
        can :read, Event
        can :manage, EventSubmission, id: EventSubmission.where(account_id: account.id).ids
      end

      can :create, EventSubmission

    end
    Rails.logger.info "END CANCAN"
  end
end
