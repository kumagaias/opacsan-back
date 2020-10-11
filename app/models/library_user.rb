class LibraryUser < ApplicationRecord
  belongs_to :user
  belongs_to :library
  enum status: { unactivated: 0, valid: 1, stopped: 2, quit: 3 }, _prefix: true
  enum role: { member: 0, admin: 1, system_admin: 2 }

  scope :id, -> id {
    where('user_id = ?', id)
  }
  scope :activation_code, -> activation_code {
    where('activation_code = ?', activation_code)
      .where('activation_code_expired_at > ?', Time.current)
  }
  scope :unactivated, -> {
    where('status = ?', 0)
  }

  class << self
    def by_activation_code(params)
      id(params[:user_id])
        .activation_code(params[:id])
        .unactivated
        .first
    end
  end
end
