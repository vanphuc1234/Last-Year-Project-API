class ProductImage < ApplicationRecord
  mount_uploader :photo, ProductImageUploader

  def image_host
    "http://10.0.2.2:3000"
  end

  def thumb_url
    path = try(:photo).try(:thumb).try(:url)
    return unless path
    "#{image_host}#{path}"
  end

  def original_url
    path = try(:photo).try(:url)
    return unless path
    "#{image_host}#{path}"
  end
end
