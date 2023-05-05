module API
  module V1
    class Base < Grape::API
      mount API::V1::Products
      mount API::V1::Searchs
      mount API::V1::Auths
      mount API::V1::Homes
      mount API::V1::Saves
    end
  end
end
