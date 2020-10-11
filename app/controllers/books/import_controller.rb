class Books::ImportController < ApplicationController

  def create
    books = import_params.to_h[:books]
      books.each do |book|
      book[:library_id] = @session[:library_id]
      book[:created_at] = Time.current
      book[:updated_at] = Time.current
      book[:register_user_id] = @session[:user_id]
    end
    Book.insert_all!(books)
    render json: {}, status: :created
  end

  private
    def import_params 
      params.permit(books: [
        :title, 
        :author,
        :publisher,
        :published_at,
        :description,
        :isbn10,
        :isbn13,
        :status,
        :library_id,
        :checkout_user_id,
        :lock_version,
      ])
    end
end
