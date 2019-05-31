require 'rails_helper'

describe UserController, type: :controller do
  context "validating a card \'tap\'" do
    context "Card number is present" do
      it "redirects to the pin endpoint" do
        User.new(id: 100000).save
        get :validate_card, params: {card_number: [100000]}
        expect(response).to redirect_to('/user/pin')
      end
    end
    context "Card number is not present" do
      it "redirects to the pin endpoint" do
        get :validate_card, params: {card_number: [999999]}
        expect(response).to redirect_to('/user/register')
      end
    end
  end
  context "validating a pin" do
    context "pin is correct" do
      it "redirects to the session endpoint" do
        User.new(id: 100000, pin:4444).save
        session["user"] = {"pin" => 4444}
        get :validate_pin, params: {one: [4], two: [4], thr: [4], fou: [4]}
        expect(response).to redirect_to('/session')
      end
    end
    context "pin is incorrect" do
      it "redirects to the incorrect pin endpoint" do
        User.new(id: 100000, pin:4444).save
        session["user"] = {"pin" => 4444}
        get :validate_pin, params: {one: [5], two: [5], thr: [5], fou: [5]}
        expect(response).to redirect_to('/user/incorrect-pin')
      end
    end
  end
end
