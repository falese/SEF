require 'bcrypt'

class UsersController < ApplicationController
  helper_method :connect_plaid
  def index
    @users = User.all
  end

  def show
    @user = get_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && connect_plaid && encrypt_cred
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user= get_user
  end

  def update
  @user= get_user
    if @user.update(user_params)&& connect_plaid && encrypt_cred
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end


  def api_accounts
    @user =  User.find(params[:user_id])
    @user.pull_accounts
    redirect_to user_path(@user)
  end



private

  def encrypt_cred
    s1 = BCrypt::Engine.generate_salt
    s2 = BCrypt::Engine.generate_salt

    encrypted_pw = BCrypt::Engine.hash_secret(@user.bank_password, s1)
    encrypted_bn = BCrypt::Engine.hash_secret(@user.bank_user_name, s2)

    @user.update_attribute(:bank_user_name, encrypted_bn)
    @user.update_attribute(:bank_password, encrypted_pw)
  end


  def connect_plaid
    @user = get_user
    p_user = Plaid.add_user('auth',@user.bank_user_name,@user.bank_password, @user.bank)
    if @user.update_attribute(:token_id,p_user.access_token)
      flash[:notice] = "You have successfully connected!"
    else
      flash[:notice] = "Please try again"
    end
  end


  def get_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :bank, :bank_user_name, :email, :bank_password)
  end
end
