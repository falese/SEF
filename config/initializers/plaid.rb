Plaid.config do |p|
  p.customer_id = ENV["plaid_customer_id"]
  p.secret = ENV["plaid_secret"]
  p.environment_location = ENV["plaid_environment"]
  # i.e. 'https://tartan.plaid.com/' for development, or
  # 'https://api.plaid.com/' for production
end
