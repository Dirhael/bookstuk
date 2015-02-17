class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_books, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where(availability: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book successfully created.'
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @book.destroy
  end

  private
  def set_books
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :description, :price, :availability)
  end

end
