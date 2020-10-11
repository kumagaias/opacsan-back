class User < ApplicationRecord
  has_many :library_users
  has_many :libraries, through: :library_users
  has_secure_password
  belongs_to :register_user, class_name: :User, optional: true
  belongs_to :update_user, class_name: :User, optional: true

  scope :email, -> email {
    where('users.email = ?', email)
  }
  scope :id, -> id {
    where('users.id = ?', id)
  }
  scope :library_name, -> name {
    joins(:libraries)
      .where('libraries.name = ?', name)
      .select('users.*, library_users.*')
  }
  scope :library_users, -> library_id {
    joins(:library_users)
      .where('library_users.library_id = ?', library_id)
      .select('users.*, library_users.*')
  }
  scope :valid, -> {
    joins(:library_users)
      .where('library_users.status = ?', 1)
  }

  validates_uniqueness_of :email, uniqueness: { scope: [:library_users] }

  class << self
    def by_id(params)
      id(params['id'])
        .first
    end

    def for_auth(params)
      email(params[:email])
        .library_name(params[:library_name])
        .valid
        .first
    end

    def for_index(params)
      library_users(params[:library_id])
    end
  end
end
