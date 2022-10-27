class ProductImageEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
  expose :id
  expose :thumb_url
  expose :original_url
end
