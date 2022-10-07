class ProductEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
  expose :title
  expose :description

  expose :business_type do |object|
    ProductPresenter.new(object).formatted_business_type
  end
  
  expose :formatted_price do |object|
    ProductPresenter.new(object).formatted_price
  end

  expose :formatted_area do |object|
    ProductPresenter.new(object).formatted_area
  end

  with_options(format_with: :iso_timestamp) do
    expose :created_at
    expose :updated_at
  end
end
