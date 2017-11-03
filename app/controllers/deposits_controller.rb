class DepositsController < ApplicationController
  def index
    @deposit = Deposit.new
  end
end
