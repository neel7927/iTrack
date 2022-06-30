class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      if current_user.account.present?
        redirect_to accounts_path
        else
        redirect_to new_account_path
      end
    end
  end
end
