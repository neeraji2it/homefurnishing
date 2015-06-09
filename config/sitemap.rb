require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://rosaralifestyle.com/'
SitemapGenerator::Sitemap.create do
  # add '/home', :changefreq => 'daily', :priority => 0.9
  # add '/contact_us', :changefreq => 'weekly'
  add homes_path
  add terms_homes_path
end
# SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks