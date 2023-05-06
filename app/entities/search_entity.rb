class SearchEntity < Grape::Entity
    format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
    expose :id
    expose :slug do |object|
        ProductPresenter.new(object).slug
      end
    
    expose :title
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

    expose :image_url do |object|
      object.product_images.first.try(:thumb_url)
    end

    expose :listing_location_name do |object|
      ProductPresenter.new(object).listing_location_name
    end

    expose :props do |object|
      ProductPresenter.new(object).props
    end 

    expose :images_count do |object|
      object.product_images.count
    end

    expose :formatted_publish_at do |object|  
      ProductPresenter.new(object).formatted_publish_at      
    end

    expose :bedrooms_count do |object|
      object.beds_count
    end
    expose :bathrooms_count do |object|
      object.baths_count
    end
    expose :formatted_sizes do |object|
      ProductPresenter.new(object).formatted_sizes
    end


    
  
    # with_options(format_with: :iso_timestamp) do
    #   expose :created_at
    #   expose :updated_at
    # end
    
    
  end
  