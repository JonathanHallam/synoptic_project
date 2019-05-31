class UserController < ApplicationController
  def validate_card
    session["card_number"] = params["card_number"][0]
    if check_card_number(session["card_number"])
      redirect_to '/user/pin'
    else
      redirect_to '/user/register'
    end
  end

  def check_card_number(card_number)
    begin
      user = User.find(card_number)
    rescue ActiveRecord::RecordNotFound
      return false
    else
      session["user"] = user
      return true
    end
  end

  def validate_pin
    pin = (params["one"] + params["two"] + params["thr"] + params["fou"]).join.to_i
    if check_pin(pin)
      redirect_to '/session'
    else
      redirect_to '/user/incorrect-pin'
    end
  end

  def check_pin(pin)
    session["user"]["pin"] == pin
  end

  def register_details
    user = User.new(
      id: session["card_number"],
      employee_id: session["card_number"],
      firstname: params["firstname"],
      surname: params["surname"],
      email: params["email"],
      mobile_number: params["phone_number"],
      card_number: session["card_number"],
      balance: 0.0,
      created_at: Time.now,
      updated_at: Time.now,
      pin: params["pin"][0]
    )
    user.save
    redirect_to '/'
  end
end
