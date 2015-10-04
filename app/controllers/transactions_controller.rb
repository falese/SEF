class TransactionsController < ApplicationController

def show
  @transaction = get_transaction
end

def index
end

def new
  @account = Account.find(:account_id)
end

def create
  @account = Account.find(:account_id)
  @transaction = @account.transactions.create(transaction_params)
  if @transaction.save
    redirect_to user_path(@user)
  else
    render 'new'
  end
end

def edit
end

def update
end

def destroy
end

private

def transaction_params
  params.require(:transaction).permit(:description, :amount, :date)
end

def get_transaction
end








end
