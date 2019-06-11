#
# #### Build the following methods on the `Startup` class
#
# - `Startup#name`
#   - returns a **string** that is the startup's name
# - `Startup#founder`
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.
# - `Startup#domain`
#   - returns a **string** that is the startup's domain
#   - Once a startup is created, the domain cannot be changed.
# - `Startup#pivot`
#   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup
# - `Startup.all`
#   - should return **all** of the startup instances
# - `Startup.find_by_founder`
#   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
# - `Startup.domains`
#   - should return an **array** of all of the different startup domains
#
# ---
class Startup

  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.find_by_founder(name)
    @@all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end
  end
  # - `Startup#sign_contract`
  #   - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float),
  #   creates a new funding round and associates it with that startup and venture capitalist.
  def sing_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|funding| funding.startup == self}
  end
  # - `Startup#num_funding_rounds`
  #   - Returns the total number of funding rounds that the startup has gotten
  def num_funding_rounds
    funding_rounds.count
  end
  # - `Startup#total_funds`
  #   - Returns the total sum of investments that the startup has gotten
  def total_funds
    funding_rounds.inject(0) {|sum, funding| sum + funding.investment}
  end
  # - `Startup#investors`
  #   - Returns a **unique** array of all the venture capitalists that have invested in this company
  def investors
    funding_rounds.map {|funding| funding.v_c}.uniq
  end
  # - `Startup#big_investors`
  #   - Returns a **unique** array of all the venture capitalists that have invested in this
  #   company and are in the Trés Commas club
  def big_investors
    funding_rounds.map {|funding| funding.v_c if VentureCapitalist.tres_commas_club.include?(funding.v_c)}.compact.uniq

  end




end
