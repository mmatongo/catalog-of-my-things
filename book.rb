require_relative 'item'
class Book
  def initialize(publisher:, cover_state:, publish_date:)
    super(publish_date: publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end