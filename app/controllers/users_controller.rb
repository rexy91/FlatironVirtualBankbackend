class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

    def index
      @users = User.all
      render json: @users
    end

    def show 
      @user = User.find_by(id: params[:id])
      render json: {user: UserSerializer.new(@user)}
    end
    
    def login 
        @user= User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          wristband = encode_token({user_id: @user.id})
          render json: {user: UserSerializer.new(@user), token: wristband}
        else
          render json: {error: "Invalid username or password"}
        end
    end

    def updateInfo
      @user = User.find_by(id:params[:id])
      # @user.update(update_params)
      @user.update(first_name:params[:first_name])
      render json:@user

    end

    def create
       @user = User.create(new_user_params)
       if @user.valid?

              #removing code verification for now 
              # @signup_code = 5.times.map{rand(7)}.join
              # @user.update(signup_code:@signup_code)
              # UserMailer.welcome_email(@user,@signup_code).deliver
              # send a sign up thank you email instead 
              UserMailer.welcome_email(@user).deliver
              byebug
              
              if params[:acc_type] == 'checking'
              # Creates checking for user, assigned acc num.
              @checking = Checking.create(user_id:@user.id, acc_num:9.times.map{rand(7)}.join)
              # Calls instance method inside checking.rb 
              @checking.checking_signup_deposit(@user, @checking)
              wristband = encode_token({user_id: @user.id})
              render json: {user: UserSerializer.new(@user), token: wristband, signup_type: 'Checking', code:@signup_code}

          elsif params[:acc_type] == 'saving'
              # Creates saving for user, assigned acc num.
              @saving = Saving.create(user_id:@user.id, acc_num:9.times.map{rand(7)}.join)
              @saving.saving_signup_deposit(@user, @saving)
              wristband = encode_token({user_id: @user.id})
              render json: {user: UserSerializer.new(@user), token: wristband, signup_type: 'Saving', code:@signup_code}
               end
        else 
              render json: {errors: @user.errors.full_messages}
        end
    end

    def create_acc_for_existingUser
        @user = User.find_by(id: params[:userId])
        if params[:accType] == 'checking'
          @checking = Checking.create(user_id:@user.id, acc_num:9.times.map{rand(7)}.join)
          @checking.checking_signup_deposit(@user, @checking)
          render json: {user: UserSerializer.new(@user), signup_type: 'Checking'}
        elsif params[:accType] == 'saving'
          @saving = Saving.create(user_id:@user.id, acc_num:9.times.map{rand(7)}.join)
          @saving.saving_signup_deposit(@user, @saving)
          # Keep json object consistent 
          render json: {user: UserSerializer.new(@user), signup_type: 'Saving'}
        end
    end

    def persist
      wristband = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), token: wristband}
    end

    private
    def new_user_params
        params.permit(:username, :password, :email, :first_name, :last_name)
    end

    def update_params
        # frontEnd names Needs to match backend if want to use strongparams.
        params.permit(:first_name, :last_name, :email, :billing_address)
    end

end
