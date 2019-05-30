class SessionController < ApplicationController
  def home
    @user = User.find(session["user"]["id"])
  end

  def top_up
    current_user = User.find(session["user"]["id"])
    new_balance = current_user.balance + params["top_up_amount"][0].to_f
    current_user.balance = new_balance
    current_user.save
    redirect_to "/session"
  end
end
