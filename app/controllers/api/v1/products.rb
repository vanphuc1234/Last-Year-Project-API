module API
  module V1
    class Products < Grape::API
      
      resource :products do
        desc 'Lấy danh sách sản phẩm theo ids'
        
        params do
          optional :product_ids, type: String, description: 'Danh sách product id phân cách bằng dấu ,'
        end

        get '/list' do
          order_by_hash = {}
          sort_by = params[:sort_by] || 'id'
          sort_order = params[:sort_order] || 'desc'
          order_by_hash[sort_by] = sort_order
          ids = params[:product_ids].to_s.split(',')
          products = Product.where(id: ids).paginate(page: params[:page], per_page: params[:per_page]).order(order_by_hash)
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
          order_by_hash = {}
          sort_by = params[:sort_by] || 'id'
          sort_order = params[:sort_order] || 'desc'
          order_by_hash[sort_by] = sort_order
          
          products = Product.paginate(page: params[:page], per_page: params[:per_page]).order(order_by_hash)
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

        get ":id" do
          Product.find(params[:id])
        end


      end

    end
  end
end
