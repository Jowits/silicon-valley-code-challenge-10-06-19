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

  def sing_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end




end
