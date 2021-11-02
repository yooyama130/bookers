class BooksController < ApplicationController
  def index
    # リスト一覧を取得する
    @books = Book.all
    # 新規投稿用のBook.newを取得する
    @book = Book.new
  end

  def show

  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
