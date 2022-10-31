class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :full_name, presence: true

  has_many :products

  before_create :generate_api_token

  mount_uploader :avatar, AvatarUploader

  def generate_api_token
    token = Digest::SHA1.hexdigest(SecureRandom.hex(10))
    self.api_token = token
  end

  def image_host
    "http://10.0.2.2:3000"
  end

  def avatar_url
    path = try(:avatar).try(:thumb).try(:url)
    return unless path
    "#{image_host}#{path}"
  end

  
end
