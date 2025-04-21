# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'optparse'

$options = {
  verbose: false,
  open_timeout: 5, # seconds
  read_timeout: 10 # seconds
}

opt = OptionParser.new
opt.banner = 'Usage: ruby sitemap2urls.rb [options] https://example.com/sitemap.xml'

opt.on('--verbose', 'Show fetching log') do
  $options[:verbose] = true
end

opt.on('--open-timeout SECONDS', Integer, 'Set open timeout (default: 5)') do |v|
  $options[:open_timeout] = v
end

opt.on('--read-timeout SECONDS', Integer, 'Set read timeout (default: 10)') do |v|
  $options[:read_timeout] = v
end

opt.parse!

start_url = ARGV[0]
if start_url.nil?
  puts opt
  exit 1
end

def fetch_urls(url)
  puts "Fetching: #{url}" if $options[:verbose]

  begin
    doc = Nokogiri::XML(URI.open(url, open_timeout: $options[:open_timeout], read_timeout: $options[:read_timeout]))
  rescue OpenURI::HTTPError => e
    warn "Failed to fetch #{url}: #{e.message}"
    return
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    warn "Timeout fetching #{url}: #{e.message}"
    return
  end

  if doc.at_xpath('//xmlns:sitemapindex')
    doc.xpath('//xmlns:sitemap/xmlns:loc').each do |loc|
      fetch_urls(loc.text)
    end
  elsif doc.at_xpath('//xmlns:urlset')
    doc.xpath('//xmlns:url/xmlns:loc').each do |loc|
      puts loc.text
    end
  else
    warn "Unknown format at: #{url}"
  end
end

fetch_urls(start_url)
