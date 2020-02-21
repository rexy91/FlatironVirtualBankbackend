class UsersController < ApplicationController
  before_action :authorized, only: [:persist, :index]

  def index
      @users = User.all 
      byebug
      render json: @users

  end

  def create
      byebug
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

  def persist
    wristband = encode_token({user_id: @user.id})
    render json: {user: UserSerializer.new(@user), token: wristband}
  end

end