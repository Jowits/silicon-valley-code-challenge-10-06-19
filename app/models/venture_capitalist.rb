# #### Build out the following methods on the `VentureCapitalist` class
#
# - `VentureCapitalist#name`
#   - returns a **string** that is the venture capitalist's name
# - `VentureCapitalist#total_worth`
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)


class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end
  # - `VentureCapitalist.all`
  #   - returns an array of all venture capitalists
  def self.all
    @@all
  end
  # - `VentureCapitalist.tres_commas_club`
  #   - returns an array of all venture capitalists in the Trés Commas club
  # (they have more then 1,000,000,000 `total_worth`)

  def self.tres_commas_club
    somebodies = @@all.select{|capitalist| capitalist.total_worth >= 1000000000}
    somebodies.each do |somebody|
      puts somebody.name
    end
  end
  # - `VentureCapitalist#offer_contract`
  #   - given a **startup object**, type of investment (as a string), and the amount invested (as a float),
  #   creates a new funding round and associates it with that startup and venture capitalist.
  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end
  # - `VentureCapitalist#funding_rounds`
  #   - returns an array of all funding rounds for that venture capitalist
  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self
    end
  end
  # - `VentureCapitalist#portfolio`
  #   - Returns a **unique** list of all startups this venture capitalist has funded
  def portfolio
    funding_rounds.map {|funding| funding.startup}.uniq
  end
  # - `VentureCapitalist#biggest_investment`
  #   - returns the largest funding round given by this venture capitalist
  def biggest_investment
    funding_rounds.max { |a, b| a.investment <=> b.investment }
  end
  # - `VentureCapitalist#invested`
  #   - given a **domain string**, returns the total amount invested in that domain
  def invested(domain)
    rounds = funding_rounds.select {|funding| funding.startup.domain == domain}
    investments = rounds.collect {|funding| funding.investment}
    investments.sum
  end

end
