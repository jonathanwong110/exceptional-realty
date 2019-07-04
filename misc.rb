class UniqloShopper::Shirt
  
  attr_accessor :name, :price, :url
	  
	def self.today
	  self.scrape_shirts
	end
  
  def self.scrape_shirts
    shirts = []
    
    shirts << self.scrape_sections

    shirts
  end

  def self.scrape_sections
    doc = Nokogiri::HTML(open("https://www.uniqlo.com/us/en/men/t-shirts"))
    
    shirt = self.new
    
    shirt.name = doc.search("div.product-name a.name-link").text
    shirt.name = doc.search("div.product-pricing span").last.text
    shirt.name = doc.search("div.product-name a.name-link").attribute("href").value
    
    shirt
    
  end


end
