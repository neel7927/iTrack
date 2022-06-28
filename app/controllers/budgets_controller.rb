class BudgetsController < ApplicationController

  def index
    @budgets = Budget.all
    @transactions = Transaction.where("account_id = #{params[:account_id]}")
    @categories = Category.all

    @monthly_transactions = monthly_transactions(@transactions)
    @total_expenses = total_expenses(@monthly_transactions)
    @features = category_features(@categories, @monthly_transactions, @budgets)
    @category_amounts = category_amounts(@features)
    @category_budgets = category_budgets(@features)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @account = Account.find(params[:account_id])
    @budget.account = @account
    @category = Category.find(params['budget']['category'].to_i)
    @budget.category = @category
    if @budget.save
      redirect_to account_budgets_path
    else
      render :new
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:amount)
  end

  def monthly_transactions(transactions)
    start_date = DateTime.now.in_time_zone(Time.zone).beginning_of_month
    end_date = DateTime.now.in_time_zone(Time.zone).end_of_month
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
          category_features << { name: category.name, amount: categories_amount, budget: budget.amount }
        else
          category_features << { name: category.name, amount: categories_amount }
        end
      end
    end
    category_features
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
