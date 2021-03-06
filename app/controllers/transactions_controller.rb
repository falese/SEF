class TransactionsController < ApplicationController
  before_filter :login_required
  include Custom


  def show
    @transaction = get_transaction
  end

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build
  end

  def create
    @user = User.find(params[:user_id])
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.create(transaction_params)
    if @transaction.save
      redirect_to user_account_path(@user, @account)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:user_id])
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])
    @transaction.destroy
    redirect_to :back
  end

private

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :date)
  end

  def get_transaction
  end


end
