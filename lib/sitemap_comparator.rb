class SitemapComparator
  def initialize(first_sitemap, second_sitemap)
    @first_sitemap = first_sitemap
    @second_sitemap = second_sitemap
  end

  def compare
    first_links = @first_sitemap.fetch
    second_links = @second_sitemap.fetch

    puts "comparing #{first_links.count} with #{second_links.count} links"

    first_links.select do |link|
      print "."

      if second_links.include? link
        print 'f'
        link
      end
    end
  end
end
