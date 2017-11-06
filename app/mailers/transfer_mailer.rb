class TransferMailer < ActionMailer::Base
  default from: "monetary.herokuapp.com"

  def transfer_email(user, transfer)
    @user = user
    @transfer = transfer
    mail to: user.email, subject: "Transfer confirmed"
  end
end
