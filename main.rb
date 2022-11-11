#!/usr/bin/env ruby
require_relative 'app'

def app_options
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Exit'
  puts "\n"
end

def check_selection(response)
  case response
  when '1'
    list_all_books
  when '2'
    list_all_people
  when '3'
    create_person
  when '4'
    create_book
  end
end

def main
  app = App.new
  app.run
end

main