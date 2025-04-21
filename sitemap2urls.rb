# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'optparse'

options = {
  verbose: false,
  open_timeout: 5,
  read_timeout: 10
}

opt = OptionParser.new
opt.banner = 'Usage: ruby sitemap2urls.rb [options] https://example.com/sitemap.xml'

opt.on('--verbose', 'Show fetching log') do
  options[:verbose] = true
end

opt.on('--open-timeout SECONDS', Integer, 'Set open timeout (default: 5)') do |v|
  options[:open_timeout] = v
end

opt.on('--read-timeout SECONDS', Integer, 'Set read timeout (default: 10)') do |v|
  options[:read_timeout] = v
end

opt.parse!

start_url = ARGV[0]
if start_url.nil?
  puts opt
  exit 1
end

def fetch_urls(url, options)
  log_fetching(url, options)

  doc = load_sitemap(url, options)
  return unless doc

  if sitemap_index?(doc)
    fetch_from_index(doc, options)
  elsif url_set?(doc)
    fetch_from_urlset(doc)
  else
    warn "Unknown format at: #{url}"
  end
end

def log_fetching(url, options)
  puts "Fetching: #{url}" if options[:verbose]
end

def load_sitemap(url, options)
  URI.open(url, open_timeout: options[:open_timeout], read_timeout: options[:read_timeout]) do |response|
    Nokogiri::XML(response)
  end
rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
  warn "Failed to fetch #{url}: #{e.message}"
  nil
end

def sitemap_index?(doc)
  doc.at_xpath('//xmlns:sitemapindex')
end

def url_set?(doc)
  doc.at_xpath('//xmlns:urlset')
end

def fetch_from_index(doc, options)
  doc.xpath('//xmlns:sitemap/xmlns:loc').each do |loc|
    fetch_urls(loc.text, options)
  end
end

def fetch_from_urlset(doc)
  doc.xpath('//xmlns:url/xmlns:loc').each do |loc|
    puts loc.text
  end
end

fetch_urls(start_url, options)
