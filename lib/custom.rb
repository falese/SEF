module Custom



  

  def calculate_balances
    @accounts = @user.accounts
    @accounts.each do |a|
        if a.real_balance == nil
          a.update_attribute(:real_balance, 0)
        end
      sum = -Transaction.where(account_id: a.id).sum(:amount)
      a.update_attribute(:calc_balance, sum + a.real_balance)
    end
  end

  def refresh_balance

    #hit endpoint and bring in new balances
      #find access token by the current user
      #send access token to endpoint
      #return JSON
      #parse JSON
      #pass data to account model
    #update balances by account
      #find the account
      #update the account
  end



end
