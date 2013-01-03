module Factory
  class << self
    def zaansstadsblad_sitemap_xml
      File.read(File.join('spec', 'fixtures', 'zaansstadsblad_sitemap.xml'))
    end
  end
end
