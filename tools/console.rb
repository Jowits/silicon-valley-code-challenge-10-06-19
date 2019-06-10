require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Startup.new("amazon", "jeff", "amazon.com")
google = Startup.new("google", "larry", "google.com")
facebook = Startup.new("facebook", "mark", "facebook.com")

renier = VentureCapitalist.new("renier", 1000)
maksym = VentureCapitalist.new("maksym", 5000)
jed = VentureCapitalist.new("jed", 100)

first_fund = FundingRound.new(amazon, renier, "Seed", 1000)
second_fund = FundingRound.new(google, renier, "Pre-seed", 2000)
third_fund = FundingRound.new(facebook, maksym, "Series A", 1000)
fourth_fund = FundingRound.new(amazon, maksym, "Series B", 2000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
