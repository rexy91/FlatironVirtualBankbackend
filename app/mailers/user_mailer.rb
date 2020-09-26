class UserMailer < ApplicationMailer
    def welcome_email(user,signup_code)

        # @signup_code = signup_code
        
        @user = user
        # byebug
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to the Virtual Banking System')
      end

    def donation_receipt
        
    end

end
