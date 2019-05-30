#CLI Controller
require_relative '../best_ramen.rb'
require 'pry'

class BestRamen::CLI

  attr_accessor :name, :description

  def call
    puts "Thank you for checking out our assortment of Ramen!"
    list
  end

  def list
  BestRamen:::Scraper.scraper_category

  puts "Please type list to see the Hot Sauce Choices or type exit: "
 input = gets.strip.downcase
 if input == "list"
   BestRamen:::Scraper.all.each.with_index(1) do |list, index|
     puts "#{index}.#{list.title}"
   end
   display_description
 elsif input == "exit"
   goodbye
 else
   puts "Invalid"
   list
 end
end

def display_description
 puts "Please type the number you are interested in!!"
 input = gets.strip.to_i
 if input <= BestRamen:::Scraper.all.size && input > 0
   index = input-1
   puts "You selected #{input}.#{BestRamen:::Scraper.all[index].title}"
   puts "#{BestRamen:::Scraper.all[index].description}"
   display_again
 elsif input <= 0 || input > BestRamen:::Scraper.all.size
   puts "Invalid number"
   display_description
 else
   goodbye
 end
end

def display_again
 puts "Is there another ramen you'd like to see?"
 answer = gets.strip.downcase
 if answer == "yes" 
   puts "Great!"
   display_description
 elsif answer == "no" 
   goodbye
 else
   puts "Invalid. Please type again."
   display_again
 end
end

def goodbye
 puts "Goodbye and enjoy your ramen!"
end

end