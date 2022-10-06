class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :full_name, presence: true

  before_create :generate_api_token

  def generate_api_token
    token = Digest::SHA1.hexdigest(SecureRandom.hex(10))
    self.api_token = token
  end
end
