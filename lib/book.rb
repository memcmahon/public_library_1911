class Book
  attr_reader :title, :author, :publication_year

  def initialize(book_params)
    @title = book_params[:title]
    @author = "#{book_params[:author_first_name]} #{book_params[:author_last_name]}"
    @publication_year = book_params[:publication_date][-4..-1]
  end
end
