class AccountsController < ApplicationController



def index
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
  @user = User.find(params[:user_id])
  @account = get_account
  if @account.update(account_params)
    redirect_to user_path(@user)
  else
    render 'edit'
end

def destroy
end

end
private

def account_params
  params.require(:account).permit(:account_name, :real_balance, :calc_balance, :item, :meta, :type, :sub_type)
end

def get_account
  @account = Account.find(params[:id])
end

def pull_accts #this connects to plaid/balance API and passes client_id (from user setup) to return a string of all accounts
  @user = User.find(params[:user_id])
  client_id = "55d6613794aec9e057dbea50"
  secret = "d170dcb9b01005357ae6a5b1f0df81"
  api_url = "https://tartan.plaid.com/balance"
  get_data = RestClient.post(api_url, :client_id => client_id,:secret => secret, :access_token => @user.access_token){|response, request, result|response }
  parse(get_data)
end

def parse(get_data) #this parses the response JSON
  h1 = JSON.parse(get_data)
  clean_accts(h1)
end

def clean_accts(h1) #this goes through the parsed JSON, removes unneccessary elements creates an array of hashes to pass to instances of accounts
  h1.values_at("accounts").each do |acct|
    acct.delete("_item")
    acct.delete("_user")
    acct.delete("_id")
    acct.delete("institution_type")
    acct.delete("type")
  end
  build_accts(h1)
end

def build_accts(h1)

end





end
