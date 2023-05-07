class MapEntity < Grape::Entity
    format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
    expose :id
    expose :slug do |object|
        ProductPresenter.new(object).slug
    end
    expose :ll do |object|
        ProductPresenter.new(object).ll
    end
    expose :"marker_image_url" do |object|
        "https://chuannhadat-assets.sgp1.digitaloceanspaces.com/cms-files/10001/pin-db258694.png"
    end
    
    


    
  
    # with_options(format_with: :iso_timestamp) do
    #   expose :created_at
    #   expose :updated_at
    # end 
end
  