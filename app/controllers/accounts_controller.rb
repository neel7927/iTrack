class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def index
    @accounts = Account.all
  end

  def show
    # obtain all transactions done by this account
    @transactions = Transaction.where("account_id = #{@account.id}")
    @monthly_transactions = monthly_transactions(@transactions)
    @categories = Category.all
    @category_names = category_names(@categories)
    @expenses_per_category = expenses_per_category(@monthly_transactions, @categories)
    @total_expenses = total_expenses(@monthly_transactions)
    @data_keys = ["Transport", "Shopping", "Grocery", "Eating Out", "Utility bill"]
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

  def monthly_transactions(transactions)
    start_date = DateTime.now.in_time_zone(Time.zone).beginning_of_month
    end_date =  DateTime.now.in_time_zone(Time.zone).end_of_month
    transactions.where(date: start_date..end_date)
  end

  def total_expenses(transactions)
    sum = 0
    transactions.each do |transaction|
      sum += transaction.amount
    end
    sum
  end

  def category_names(categories)
    category_names = []
    categories.each do |category|
      unless category.name == "Income"
        category_names << category.name
      end
    end
    category_names
  end

  def expenses_per_category(transactions, categories)
    expenses_per_category = []
    categories.each do |category|
      category_expense = 0
      transactions.each do |transaction|
        if (transaction.category_id == category.id) && (category.name != "Income")
          category_expense += transaction.amount
        end
      end
      expenses_per_category << category_expense
    end
    expenses_per_category
  end

end
