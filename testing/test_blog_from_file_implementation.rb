require "builder"     
require "ostruct"

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
    assert_equal File.read("expected.rss"), @blog.to_rss
  end
     
end
