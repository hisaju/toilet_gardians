class Toilet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  before_save :set_uuid

  def set_uuid
    uuid = SecureRandom.hex(13)
    while (Toilet.find_by(uuid: uuid)) do
      uuid = SecureRandom.hex(13)
    end
    self.uuid = uuid
  end
end
