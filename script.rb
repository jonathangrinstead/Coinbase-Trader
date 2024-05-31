require 'coinbase/wallet'
require 'dotenv'

Dotenv.load

API_KEY = ENV['CB_API_KEY']
API_SECRET = ENV['CB_SECRET_KEY']

client = Coinbase::Wallet::Client.new(api_key: API_KEY, api_secret: API_SECRET)
begin
accounts = client.accounts
accounts.each do |account|
  puts "Account ID: #{account.id}"
  puts "Name: #{account.name}"
  puts "Balance: #{account.balance.amount} #{account.balance.currency}"
end
rescue Coinbase::Wallet::APIError => e
  puts "Response body: #{e}"
end
