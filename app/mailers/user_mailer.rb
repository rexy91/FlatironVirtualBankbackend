class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to the Virtual Banking System')
      end

    def complain(user, message)
      # byebug
      @message = message
      @user = user
        mail(to: 'rexye1991@gmail.com', subject: 'Complaining')
    end

end
