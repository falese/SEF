class AccountsController < ApplicationController
before_filter :login_required
include Custom

  def index
    @user = User.find(params[:user_id])
    @accounts = Account.all
  end

  def show
    @account = get_account
    calculate_balance
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

  def update(real_balance, user, acct)
    @user = user.id
    @account = acct.id
      if @account.update_column(:real_balance, real_balance) && calculate_balance
        redirect_to user_path(@user)
      else
        render 'edit'

    # @user = User.find(params[:user_id])
    # @account = get_account
    # if @account.update(account_params) && calculate_balance
    #   redirect_to user_path(@user)
    # else
    #   render 'edit'
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

  def calculate_balance
    @account = Account.find(params[:id])
    sum = -Transaction.where(account_id: @account.id).sum(:amount)
    @account.update_attribute(:calc_balance, sum + @account.real_balance)
  
  end


end
