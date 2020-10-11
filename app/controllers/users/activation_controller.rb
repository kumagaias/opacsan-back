class Users::ActivationController < ApplicationController
  skip_before_action :require_login

  def update
    library_user = LibraryUser.by_activation_code(params)
    raise NotFoundError, Settings.error.invalid_activation_params if !library_user
    library_user.status = :valid
    library_user.save!
    render json: Utils.camelize({
      library_id: library_user.library_id,
      library_name: library_user.user.name,
      role: library_user.role,
      token: Session.create(
        library_user.id,
        library_user.role,
        library_user.library_id
      ),
      userId: library_user.user_id,
      userName: library_user.user.name,
    }), status: :created
  end
end
