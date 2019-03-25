require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    @doc=Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end
  
  def get_courses
    get_page
    @doc.css('.posts-holder')
  end

  def make_courses
    get_courses.css("h2").each do |course| 
      # binding.pry 
      a=Course.new(course.text)
      a.schedule=""
      a.description=""
    end
  end

end



