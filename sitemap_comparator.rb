require_relative "./lib/sitemap"
require_relative "./lib/sitemap_comparator"

first_sitemap = ARGV[0]
second_sitemap = ARGV[1]

first = Sitemap.new(first_sitemap)
second = Sitemap.new(second_sitemap)

comparator = SitemapComparator.new(first, second)

comparator.compare.each do |link|
  puts "found duplicate: #{link.url}"
end
