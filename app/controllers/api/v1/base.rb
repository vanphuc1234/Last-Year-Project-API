module API
  module V1
    class Base < Grape::API
    
      mount API::V1::Products
      mount API::V1::Searchs
    end
  end
end
