class Libraries::NameController < ApplicationController
  skip_before_action :require_login

  def show 
    @library = Library.find_by(name: params[:name])
    status = :not_found
    status = :ok if @library
    render json: {}, status: status
  end
end
