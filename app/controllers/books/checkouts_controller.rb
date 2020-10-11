class Books::CheckoutsController < ApplicationController

  def index
    books = BookCheckoutHistory.where(book_id: @session[:library_id])
    render json: books
  end

  def update 
    book = Book.find(params[:book_id])
    ActiveRecord::Base.transaction do
      book.update!(checkouts_params)
      @bookCheckoutHistory = BookCheckoutHistory.new(checkouts_params.merge({
        book_id: book.id,
      }))
      @bookCheckoutHistory.save!
    end 
    render json: {}, status: :created
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def checkouts_params
      params.require(:book).permit(
        :checkout_user_id,
      )
    end
end

