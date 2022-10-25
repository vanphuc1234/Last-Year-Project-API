class ProductImage < ApplicationRecord
  belongs_to :product, optional: true

  has_one_attached :image

end

