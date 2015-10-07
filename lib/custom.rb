module Custom

  def calculate_balance
    @account = Account.find(params[:account_id])
    sum = -Transaction.where(account_id: @account.id).sum(:amount)
    @account.update_attribute(:calc_balance, sum + @account.real_balance)
    redirect_to user_path(@account.user_id)
  end
  def calculate_balances
    @accounts = @user.accounts
    @accounts.each do |a|
      sum = -Transaction.where(account_id: a.id).sum(:amount)
      a.update_attribute(:calc_balance, sum + a.real_balance)
    end
  end


end
