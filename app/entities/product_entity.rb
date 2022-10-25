class ProductEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.iso8601 }

  expose :id
  expose :title
  expose :description
  expose :ads_type do |object|
    "normal"
  end

  expose :formatted_price do |object|
    ProductPresenter.new(object).formatted_price
  end

  expose :formatted_area do |object|
    ProductPresenter.new(object).formatted_area
  end

  expose :formatted_price_per_m2 do |object|
    ProductPresenter.new(object).formatted_price_per_m2
  end

  expose :full_address do |object|
    full_address = ProductPresenter.new(object).full_address
    if(full_address == "")
      nil
    else full_address
    end
  end

  expose :business_type do |object|
    ProductPresenter.new(object).formatted_business_type
  end

  expose :formatted_publish_at do |object|
    "Hôm nay"
  end

  expose :images do |object|
    # images = []
    # images.push({
    #   "id": 116838,
    #   "thumb_url": "https://chuannhadat-assets.sgp1.digitaloceanspaces.com/product-images/11868/Bán-Nhà-mặt-phố-Đường-Trần-Quang-Khải-Quận-1--Diện-tích-64m2_d3d7b8_thumb.jpg",
    #   "original_url": "https://chuannhadat-assets.sgp1.digitaloceanspaces.com/product-images/11868/Bán-Nhà-mặt-phố-Đường-Trần-Quang-Khải-Quận-1--Diện-tích-64m2_d3d7b8_big.jpg"
    # })
    # images
    object.product_images.map do |product_image|
      {
        id: product_image.id,
        url: "http://localhost:3000#{product_image.photo.url}",
        thumb_url: "http://localhost:3000#{product_image.photo.thumb.url}"
      }
    end
  end

  expose :images_count do |object|
    object.product_images.count
  end

  expose :description

  expose :detail_props do |object|
    ProductPresenter.new(object).detail_props
  end

  expose :owner do |object|  
    user = User.find(object.user_id)

    ProfileEntity.new(user)
  end
  

  # with_options(format_with: :iso_timestamp) do
  #   expose :created_at
  #   expose :updated_at
  # end
  
  
end
