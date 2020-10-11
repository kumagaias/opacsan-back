class Books::CheckoutHistoriesController < ApplicationController
  before_action :set_book_checkout_history, only: [:show, :update, :destroy]

  # GET /book_checkout_histories
  def index
    @book_checkout_histories = BookCheckoutHistory.all

    render json: @book_checkout_histories
  end

  # GET /book_checkout_histories/1
  def show
    render json: @book_checkout_history
  end

  # POST /book_checkout_histories
  def create
    @book_checkout_history = BookCheckoutHistory.new(book_checkout_history_params)
    @book_checkout_history.save!
  end

  # PATCH/PUT /book_checkout_histories/1
  def update
    if @book_checkout_history.update(book_checkout_history_params)
      render json: @book_checkout_history
    else
      render json: @book_checkout_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_checkout_histories/1
  def destroy
    @book_checkout_history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_checkout_history
      @book_checkout_history = BookCheckoutHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_checkout_history_params
      params.require(:book_checkout_history).permit(
        :book_id,
        :status,
      )
    end
end
