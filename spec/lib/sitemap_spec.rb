require_relative "../../lib/sitemap"
require_relative "../factory"

describe Sitemap do
  let(:xml) { Factory.zaansstadsblad_sitemap_xml }
  subject { Sitemap.new("") }

  context "#parse" do
    let(:links) { subject.parse(xml) }
    let(:link) { links.first }

    it "parses without failure" do
      expect(link.url).to eq "http://www.zaansstadsblad.nl/nieuws/44332-geluid-in-handen-van-hps-audio"
    end

    it "extracts pathname" do
      expect(link.pathname).to eq "/nieuws/44332-geluid-in-handen-van-hps-audio"
    end

    it "equals other link by pathname" do
      link_1 = Sitemap::Link.new("http://example.com/path1")
      link_2 = Sitemap::Link.new("http://otherexample.com/path1")

      expect(link_1).to eq link_2
    end
  end
end
