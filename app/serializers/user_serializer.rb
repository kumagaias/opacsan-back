class UserSerializer < ActiveModel::Serializer
  has_many :library_users
  attributes :id,
    :email,
    :name,
    :role,
    :status,
    :created_at,
    :updated_at

  def role 
    object.library_users.map{ |h| h[:role] }.first
  end

  def status
    object.library_users.map{ |h| h[:status] }.first
  end
end
