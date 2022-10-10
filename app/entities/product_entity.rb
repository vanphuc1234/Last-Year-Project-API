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
    ProductPresenter.new(object).full_address
  end

  expose :business_type do |object|
    ProductPresenter.new(object).formatted_business_type
  end

  expose :formatted_publish_at do |object|
    "Hôm nay"
  end

  expose :description

  
  
  expose :category_type do |object|
    object.category_type || 'N/A'
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
