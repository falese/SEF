module Custom
  def calculate_balance
    @account = Account.find(params[:account_id])
    sum = -Transaction.where(account_id: @account.id).sum(:amount)
    @account.update_attribute(:calc_balance, sum + @account.real_balance)
    redirect_to user_path(@account.user_id)
  end
end
