class DepositsController < ApplicationController
  def index
    @deposit = Deposit.new
  end

  def create
    @deposit = current_user.deposits.new(deposit_params)
    if @deposit.save
      redirect_to dashboard_path, notice: "Successfully deposited funds"
    else
      redirect_to dashboard_path, notice: "Deposit failed, try again"
  end
end
