class TransfersController < ApplicationController
  def index
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @receiver = User.find_by_email(@transfer.recipient)
    transfer_action
  end

  def transfer_action
    if @receiver && (current_user.balance.to_i > @transfer.amount.to_i)
      @transfer.update(recipient_id: @receiver.id, sender_id: current_user.id)
      rem_balance = current_user.balance.to_i - @transfer.amount.to_i
      current_user.update(balance: rem_balance)
      recipient_balance = @receiver.balance.to_i + @transfer.amount.to_i
      @receiver.update(balance: recipient_balance)
      redirect_to dashboard_index_path, notice: 'Transfer successful'
    else
      redirect_to transfers_path, alert: 'Failed. Is the user in this system? Is account balance enough?'
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:amount, :recipient, :transfer_channel)
  end
end
