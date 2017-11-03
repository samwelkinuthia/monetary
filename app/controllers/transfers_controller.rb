class TransfersController < ApplicationController
  def index
    @transfer = Transfer.new
  end


  private
  def transfer_params
    params.require(:transfer).permit(:amount, :recipient, :transfer_channel)
  end
end
