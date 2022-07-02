class TransactionsController < ApplicationController

 before_action :set_transaction, only: [:edit, :update]

  def index
    if params[:query].present?
      @transactions = Transaction.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @transactions = Transaction.all
    end
  end

  def edit
  end

  def update
    @category = Category.find(params['transaction']['category'].to_i)
    @transaction.update(category: @category)
    redirect_to accounts_path
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
