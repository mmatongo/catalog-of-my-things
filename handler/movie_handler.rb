require './movie.rb'
require './source.rb'

class Movie_Handler
    attr_accessor :movie
    def initialize()
        @movies= []
        @sources = [] 
    end

    def add_movie
        puts
        print 'Movie name: '
        name = gets.chomp
        print 'Source: '
        source_name= gets.chomp
        print 'Published Date: '
        publish_date = gets.chomp
        print 'Silet? [Y/N]: '
        silet = gets.chomp != 'n'
        print 'Archived? [Y/N]: '
        archived = gets.chomp != 'n'

        @sources.push(Source.new(source_name))
        @movies.push(Movie.new(publish_date: publish_date, silet: silet, archived: archived, name: name))
        puts
        puts('Successfully added movie!')
        puts
    end

    def all_movie
        if @movies.empty? 
            puts 'Sorry! Right now we have no movies'
        else
            puts 'All movies are: '
            puts
            @movies.each { |movie| puts "Title: '#{movie.name}', Published_Date: #{movie.publish_date}, Silet: #{movie.silet}, ID: #{movie.id}" }
            puts
        end
    end

    def all_soucrce
        if @sources.any?
        puts
        puts 'All sources are: '
        @sources.each { |source| puts "ID: #{source.id}, Name: '#{source.name}'" }
        puts
        else
            puts 'Sorry! We have no sources detail'
        end
    end
end
