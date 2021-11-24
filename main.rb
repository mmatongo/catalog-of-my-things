require_relative './handler/movie_handler'
require_relative 'handlers/book_label_handler'
# rubocop:disable Metrics

class App
  include(BookLabelHandlers)
  def initialize
    @movie_handler = MovieHandler.new
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List of games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all source',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '13' => 'Exit'
    }
  end

  def run
    @movie_handler.load_movies_from_files
    @movie_handler.load_sources_from_files
    puts 'Welcome to the Catalog Of My Things! '
    puts ''
    puts 'Please choose an option by entering a number.'
    print 'enter option: '
    loop do
      @options.each { |key, value| puts "\t #{key}) #{value}" }

      option = gets.chomp
      break if option == '13'

      handle_option option
    end
  end

  def handle_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      puts 'List all music albums'
    when '3'
      @movie_handler.all_movie
    when '4'
      puts 'List of games'
    when '5'
      puts 'List all genres'
    when '6'
      list_all_labels
    when '7'
      puts 'List all authors'
    when '8'
      @movie_handler.all_soucrce
    when '9'
      add_book
    when '10'
      puts 'Add a music album'
    when '11'
      @movie_handler.add_movie
    when '12'
      puts 'Add a game'
    else
      puts 'That is not a valid option'
    end
  end
end

def main
  app = App.new
  app.run
end
# rubocop:enable Metrics
main
