class UniqloShopper::Shirt
  
  # ensure that you are creating actual shirt objects -- instacnes of the Shirt class 
  # each time a new Shirt object is made, we shlud save it into a class variable 
  # we therefore would also need a class getter method to expose (return) that class variable
  # it would be a good idea to build a Scraper class 
  
  # Inside CLI class, we might say `UniqloShopper::Shirt.all`
  
  attr_accessor :name, :price, :url
	
	  @sections = []
	  
	def self.today
	  self.scrape_shirts
	end
  
  def self.scrape_shirts
    shirts = self.scrape_sections

    shirts
  end

  def self.scrape_sections
    if @sections.length == 0
      doc = Nokogiri::HTML(open("https://www.uniqlo.com/us/en/men/t-shirts"))
      doc.css("div.product-tile").each do |section|
        item = {
          :name => section.css("div.product-name a.name-link").text,
          :price => section.css("div.product-pricing span").last.text,
          :url => section.css("div.product-name a.name-link").attribute("href").value
        }
        @sections << item
      end
    end
    @sections
  end


end
