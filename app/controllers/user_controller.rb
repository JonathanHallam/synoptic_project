require 'pry'
class UserController < ApplicationController
  def validate_card
    session["card_number"] = params["card_number"]
    if check_card_number(params["card_number"])
      redirect_to '/user/pin'
    else
      redirect_to '/user/register'
    end
  end

  def check_card_number(card_number)
    false
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
    false
  end

  def register_details
    redirect_to '/'
  end
end
