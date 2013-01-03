require_relative "../../lib/sitemap_comparator"
require_relative "../../lib/sitemap"
require_relative "../factory"

describe SitemapComparator do
  let(:zsb_xml) { Factory.zaansstadsblad_sitemap_xml }
  let(:anb_xml) { Factory.amsterdamsnieuwsblad_sitemap_xml }
  let(:zsb_sitemap) { Sitemap.new("http://zaansstadsblad.nl/sitemap.xml")}
  let(:anb_sitemap) { Sitemap.new("http://amsterdamsnieuwsblad.nl/sitemap.xml")}

  context "#compare" do
    before do
      @zsb_link1 = Sitemap::Link.new('http://example.com/path1')
      @zsb_link2 = Sitemap::Link.new('http://example.com/path2')
      @zsb_link3 = Sitemap::Link.new('http://example.com/path3')

      @anb_link1 = Sitemap::Link.new('http://otherexample.com/path1')
      @anb_link2 = Sitemap::Link.new('http://otherexample.com/other1')
      @anb_link3 = Sitemap::Link.new('http://otherexample.com/other2')

      zsb_sitemap.stub(:fetch).and_return([@zsb_link1, @zsb_link2, @zsb_link3])
      anb_sitemap.stub(:fetch).and_return([@anb_link1, @anb_link2, @anb_link3])
    end

    subject{ SitemapComparator.new(zsb_sitemap, anb_sitemap)}
    it "compares two sitemaps and returns duplicate urls" do
      expect(subject.compare).to eq [@zsb_link1]
    end
  end
end
