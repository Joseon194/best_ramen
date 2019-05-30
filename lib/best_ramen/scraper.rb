require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative '../best_ramen.rb'

class BestRamen::Scraper

def self.scrape_sauces
  sauces = []
  doc = Nokogiri::HTML(open("https://gurunavi.com/en/japanfoodie/2018/02/regional-ramen.html?__ngt__=TT0f814bd6d006ac1e4aecefAm_8_whk8bkpAeWIi1dV3E"))
  list_sauce = doc.css("h3")
  list_sauce.each do |ramen|
    new_sauce = self.new
    new_sauce.name = sauce.css("h3").text.strip
    new_sauce.description = sauce.css("p").children[0].text.strip
    ramen = new_ramen
  end
  ramen
end