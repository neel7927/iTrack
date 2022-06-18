class BudgetsController < ApplicationController

  def new
  end

  def create
  end

private

def budget_params
  params.require(:budget).permit()
end

end
