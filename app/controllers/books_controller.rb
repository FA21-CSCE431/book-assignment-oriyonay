class BooksController < ApplicationController
  def index
    @books = Book.order('title ASC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    # we make sure that all fields have been filled in order to prevent any errors later on:
    unless verify(@book)
      @error = 'make sure to fill everything out and that price is non-negative!'
      render('new')
      return
    end

    if @book.save
      @flash_notice = 'book added successfully.' 
      redirect_to(books_path, notice: @flash_notice)
    else
      render('new')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      @flash_notice = 'book updated successfully.'
      redirect_to(book_path(@book), notice: @flash_notice)
    else
      @error = true
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @flash_notice = 'book deleted successfully.'
    redirect_to(books_path, notice: @flash_notice)
  end

  private def book_params
    params.require(:book).permit(:title, :author, :price, :published_date)
  end

  def verify(book)
    if book.title.empty? or book.author.empty? or book.price.nil? or book.price < 0
      return false
    end
    return true
  end
end
