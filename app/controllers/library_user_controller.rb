class LibraryUserController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    @library_user = LibraryUser.new(library_user_params.merge({
      activation_code: Utils.get_activation_code,
      activation_code_expired_at: Utils.get_activation_expired_at,
    }))
    @library_user.save!
    UserMailer.activate(User.find(@library_user.user_id)).deliver
    render json: @library_user, status: :created, location: @library_user
  end

  private
    def library_user_params
      params.require(:library_user).permit(:user_id, :library_id)
    end
end
