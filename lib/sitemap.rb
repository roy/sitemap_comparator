require "nokogiri"
require "open-uri"

class Sitemap
  attr_reader :url
  attr_reader :links

  def initialize(url)
    @url = url
  end

  def parse(xml)
    doc = Nokogiri::XML xml
    doc.remove_namespaces!
    
    doc.search("loc").map do |doc_item|
      Link.new_from_loc(doc_item)
    end
  end

  def fetch
    xml = get url
    parse xml
  end

  def get(url)
    open url
  end

  class Link
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def self.new_from_loc(loc)
      new(loc.text)
    end

    def pathname
      url[/\/(?!.*\.).*/]
    end

    def ==(other)
      pathname == other.pathname
    end
  end
end
