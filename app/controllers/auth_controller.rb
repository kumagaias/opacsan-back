class AuthController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def show
    render json: {}
  end

  def create
    user = User.for_auth(auth_params)
    if !user || !user.authenticate(auth_params[:password])
      raise UnauthorizedError, Settings.error.invalid_auth_params
    end
    render json: Utils.camelize({
      id: user.id,
      name: user.name,
      role: user.role,
      library_id: user.library_id,
      library_name: user.libraries.first.name,
      token: Session.create(user.id, user.role, user.library_id)
    }), status: :created
  end

  def destroy
    Session.destroy(@session['token'])
  end

  private
    def auth_params
      params.require(:auth).permit(
        :email,
        :library_name,
        :password,
      )
    end
end
