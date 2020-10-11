class BookVolumesController < ApplicationController
  before_action :set_book_volume, only: [:show, :update, :destroy]

  # GET /book_volumes
  def index
    @book_volumes = BookVolume
      .preload(:book, :book_volume_histories)
      .by_library_id(@session[:library_id])
    render json: @book_volumes
  end

  # GET /book_volumes/1
  def show
    render json: @book_volume
  end

  # POST /book_volumes
  def create
    @book_volume = BookVolume.new(book_volume_params.merge({
      register_user_id: @session[:user_id]
    }))
    pp @book_volume

    if @book_volume.save
      render json: @book_volume, status: :created, location: @book_volume
    else
      render json: @book_volume.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_volumes/1
  def update
    ActiveRecord::Base.transaction do
      @book_volume.update!(book_volume_params.merge({
        update_user_id: @session['user-id'],
      }))
      BookVolumeHistory.create(@book_volume.dup.attributes.merge({
        book_volume_id: @book_volume.id,
      }))
    end
    # render json: @book_volume.errors, status: :unprocessable_entity
  end

  # DELETE /book_volumes/1
  def destroy
    @book_volume.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_volume
      @book_volume = BookVolume.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_volume_params
      params.require(:book_volume).permit(
        :book_id,
        :volume,
        :published_at,
        :description,
        :isbn10,
        :isbn13,
        :status,
        :checkout_user_id,
        :lock_version,
      )
    end
end
