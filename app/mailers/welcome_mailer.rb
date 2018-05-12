class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail(to: @user.email, subject: "welcome",from:'saladar_man@hotmail.com')
    end

end
