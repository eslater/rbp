require "builder"     
require "ostruct"

# This one is supposed to fail, can you tell why??
# HINT: the DocString is exactly as it appears in the book, but it is off by only 1 character

class Blog < OpenStruct             

  def entries
    @entries ||= []
  end                  

  def to_rss
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.rss version: "2.0" do
      xml.channel do
        xml.title       title
        xml.link        "http://#{domain}/"
        xml.description  description
        xml.language    "en-us"

        @entries.each do |entry|
          xml.item do
            xml.title       entry.title
            xml.description entry.description
            xml.author      author
            xml.pubDate     entry.published_date
            xml.link        entry.url
            xml.guid        entry.url
          end
        end
      end
    end
  end    
           
end  

require "test/unit"
require_relative "test_unit_extensions"

require "time"
require "nokogiri"

class BlogTest < Test::Unit::TestCase

FEED = <<-EOS
<?xml version="1.0" encoding="UTF-8"?><rss version="2.0"
><channel><title>Awesome</title><link>http://majesticseacreature.com/</link>
<description>Totally awesome</description><language>en-us</language><item>
<title>First Post</title><description>Nothing interesting</description>
<author>Gregory Brown</author><pubDate>2008-08-08 00:00:00 -0400</pubDate>
<link>http://majesticseacreature.com/awesome.html</link>
<guid>http://majesticseacreature.com/awesome.html</guid></item></channel></rss>
EOS

  def setup
    @blog = Blog.new
    @blog.title       = "Awesome"
    @blog.domain      = "majesticseacreature.com"   
    @blog.description = "Totally awesome"      
    @blog.author      = "Gregory Brown"
  
    entry = OpenStruct.new
    entry.title          = "First Post"
    entry.description    = "Nothing interesting"   
    entry.published_date = Time.parse("08/08/2008") 
    entry.url            = "http://majesticseacreature.com/awesome.html" 
  
    @blog.entries << entry
  end

  must "have a totally awesome RSS feed" do
    assert_equal FEED.delete("\n"), @blog.to_rss
  end
     
end
