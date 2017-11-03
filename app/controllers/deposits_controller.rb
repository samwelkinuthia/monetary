class DepositsController < ApplicationController
  def index
    @deposit = Deposit.new
  end

  def create
    @deposit = current_user.deposits.new(deposit_params)
    if @deposit.save
      @balance = (current_user.balance + @deposit.amount).to_i
      current_user.update(balance:@balance)
      redirect_to dashboard_index_path, notice: "Successfully deposited funds"
    else
      redirect_to dashboard_index_path, notice: "Deposit failed, try again"
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount)
  end
end
