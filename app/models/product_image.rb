class ProductImage < ApplicationRecord
  mount_uploader :photo, ProductImageUploader
end
