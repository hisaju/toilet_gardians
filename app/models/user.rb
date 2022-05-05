class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :toilets, dependent: :destroy
  accepts_nested_attributes_for :toilets

  validates :email, presence: true, length: { maximum: 255, allow_blank: true },
                    uniqueness: { case_sensitive: true }, email_format: { allow_blank: true }
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
