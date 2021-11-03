class BooksController < ApplicationController
  def index
    # リスト一覧を取得する
    @books = Book.all
    # 新規投稿用のBook.newを取得する
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'New book successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = 'successfully destroyed.'
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
