module API
  module V1
    class Products < Grape::API
      helpers API::V1::Helpers::APIHelpers
      helpers API::V1::Helpers::ProductAPIHelpers

      resource :products do
        desc 'Lấy danh sách sản phẩm theo ids'

        params do
          optional :product_ids, type: String, description: 'Danh sách product id phân cách bằng dấu ,'
        end

        get '/list' do
          ids = params[:product_ids].to_s.split(',')
          products = Product.where(id: ids).paginate(page: page, per_page: per_page).order(order_by_hash)
          {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: products
          }
        end
        
        desc 'Danh sách sản phẩm'

        params do
          optional :page, type: Integer, description: 'Số trang'
          optional :per_page, type: Integer, description: 'Số dòng trên trang'
          optional :sort_by, type: String, values: ['id']
          optional :sort_order, type: String, values: ['asc', 'desc']
        end

        get do
          test_product_helper
          products = Product.paginate(page: page, per_page: per_page).order(order_by_hash)
          {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: products
          }
        end

        desc 'Xem chi tiết sản phẩm'
        params do
        end

        # services modules
        # helpers x
        # presenters (decorators) x
        # serialize (marshal) | deserialize (unmarshal) v (entity = serializer) x
        get ":id" do
          product = Product.find(params[:id])
          ProductEntity.new(product)
        end


      end

    end
  end
end
