class AccountsController < ApplicationController
  authorize_resource
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @accounts = Account.all
    respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = Account.new
    @account.build_address
    respond_with(@account)
  end

  def edit
    @account.build_address unless @account.address
  end

  def create
    @account = Account.new(account_params)
    @account.save
    respond_with(@account)
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(
        :user_id, :first_name, :last_name,
        address_attributes: [
          :venue_name,
          :first_line,
          :second_line,
          :city,
          :state,
          :zipcode
        ]
      )
    end
end
