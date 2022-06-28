class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def index
    @accounts = Account.all
  end

  def show
    @transactions = Transaction.where("account_id = #{@account.id}") # obtain all transactions done by this account
    @categories = Category.all
    @budgets = Budget.where("account_id = #{@account.id}")

    @monthly_transactions = monthly_transactions(@transactions) # obtain transactions this month
    @total_expenses = total_expenses(@monthly_transactions)
    @features = category_features(@categories, @monthly_transactions, @budgets)
    @category_names = category_names(@features)
    @category_amounts = category_amounts(@features)
    @category_budgets = category_budgets(@features)
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
      sum += transaction.amount unless transaction.category_id == 6
    end
    sum
  end

  def category_features(categories, transactions, budgets)
    category_features = []
    categories.each do |category|
      categories_amount = 0
      transactions.each do |transaction|
        if transaction.category_id == category.id
          categories_amount += transaction.amount
        end
      end
      budgets.each do |budget|
        if budget.category_id == category.id
          category_budget = budget.amount
        else
          category_budget = 0
        end
        category_features << { name: category.name, amount: categories_amount, budget: category_budget }
      end
    end
    category_features
  end

  def category_names(features)
    category_names = []
    features.each do |feature|
      category_names << feature[:name]
    end
    category_names
  end

  def category_amounts(features)
    category_amounts = []
    features.each do |feature|
      category_amounts << feature[:amount]
    end
    category_amounts
  end

  def category_budgets(features)
    category_budgets = []
    features.each do |feature|
      category_budgets << feature[:budget]
    end
    category_budgets
  end

end
