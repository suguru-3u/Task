class NotificationMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'

  def complete_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}/edit"
    mail(subject: "Your Infomation change" ,to: @user.email)
  end
end
