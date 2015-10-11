class AccountsController < ApplicationController
include Custom

before_filter :login_required

  def index
    @user = User.find(params[:user_id])
    @accounts = Account.all
  end

  def show
    @account = get_account
  end

  def new
    @user = User.find(params[:user_id])
    @account = @user.accounts.build
  end

  def create
    @user = User.find(params[:user_id])
    @account = @user.accounts.create(account_params)
    if @account.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @account = get_account
  end

  def update
    @user = user
    @account = account
    if @account.update(account_params) && calculate_balance
      redirect_to user_path(@user)
    else
      render 'edit'
    end



  end

  def destroy
  end


  private

  def account_params
    params.require(:account).permit(:account_name, :real_balance, :calc_balance, :item, :meta, :type, :sub_type, :bank_account_id)
  end

  def get_account
    @account = Account.find(params[:id])
  end



end
