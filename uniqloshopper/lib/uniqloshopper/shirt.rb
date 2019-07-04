class UniqloShopper::Shirt

  attr_accessor :name, :price, :url
  
  @@all = []
  
  def initialize(name:, price:, url:)
    @name = name
    @price = price
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end
