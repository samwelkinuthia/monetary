class TransferMailer < ApplicationMailer
  default from: "monetary@gmail.com"

  def transfer_email(user, transfer)
    @user = user
    @transfer = transfer
    mail to: user.email, subjectL "Transfer confirmed"
  end
end
