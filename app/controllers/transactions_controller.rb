class TransactionsController < ApplicationController
  def index
    if params[:query].present?
      @transactions = Transaction.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @transactions = Transaction.all
    end
  end
end
