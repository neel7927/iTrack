class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end


  private

  def account_params
    params.require(:account).permit(:account_name, :account_number, :account_type)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
