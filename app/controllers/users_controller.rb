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

    def create
       @user = User.create(new_user_params)
       if @user.valid?
        # byebug
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
       else 
        # render json: {errors: @user.errors.full_messages}
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

end
