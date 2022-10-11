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
    "https://bds-static-2.b-cdn.net/resize/624x476/2022/07/17/20220717182938-719c_wm.jpg?width=230&height=140&func=crop"
  end

  expose :listing_location_name do |object|
    ProductPresenter.new(object).listing_location_name
  end

  expose :props do |object|
    ProductPresenter.new(object).props
  end 

  expose :images_count do |object|
    2
  end

  expose :formatted_publish_at do |object|
    "Hôm nay"
  end


    
  
    # with_options(format_with: :iso_timestamp) do
    #   expose :created_at
    #   expose :updated_at
    # end
    
    
  end
  