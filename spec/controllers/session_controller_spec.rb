require 'rails_helper'

describe SessionController, type: :controller do
  context "topping up" do
    it "updates the users balance" do
      user = User.new(id: 100000, balance: 0.04)
      user.save
      session["user"] = {"id" => 100000, "pin" => 4444}

      get :top_up, params: {top_up_amount: [10.05]}
      expect(User.find(100000).balance.to_f).to eq(10.09)
    end
  end
end
