class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def index
    @accounts = Account.all
  end

  def show
    # obtain all transactions done by this account
    @transactions = Transaction.where("account_id = #{@account.id}")

    # obtain all transactions made this month by account
    @start_date = DateTime.now.in_time_zone(Time.zone).beginning_of_month
    @end_date =  DateTime.now.in_time_zone(Time.zone).end_of_month
    @monthly_transactions = Transaction.where(date: @start_date..@end_date)

    # caategories
    @categories = Category.all
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
