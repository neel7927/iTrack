class BudgetsController < ApplicationController

  def index
    @budgets = Budget.all
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

end
