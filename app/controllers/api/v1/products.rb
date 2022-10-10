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

        desc 'Đăng sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          requires :title, type: String, description: 'Tiêu đề'
          requires :description, type: String, description: 'Mô tả'
          requires :price, type: Float, description: 'Giá'
          requires :area, type: Float, description: 'Diện tích'
          # requires :api_token, type: String, description: 'api token'
        end

        post do   
                   
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            product = Product.create(
              title: params[:title], 
              description: params[:description], 
              price: params[:price],
              area: params[:area],
              user_id: user.id
            )
          end

          if (product.valid?)
            { status: true, product: product, owner: user}
          else
            { status: false, message: product.errors.full_messages.to_sentence}
          end
        end

        desc 'Cập nhật sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          requires :id, type: Integer, description: 'Product id'
          optional :title, type: String, description: 'Tiêu đề'
          optional :description, type: String, description: 'Mô tả'
          optional :price, type: Float, description: 'Giá'
          optional :area, type: Float, description: 'Diện tích'
          optional :business_type, type: String, description: 'Loại BĐS'
          
        end

        put ":id" do    
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            product = Product.find(params[:id])
            if(product.valid?)

              product.update(title: params[:title],description: params[:description],price: params[:price],area: params[:area],business_type: params[:business_type])

            end
          end
         
          { status: true, product: product, owner: user}
          
        end

        desc 'Xóa sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          requires :id, type: Integer, description: 'Id sản phẩm sẽ xóa'
          
        end

        delete do   
                   
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
           product = Product.find(params[:id])
           if(product.valid?)
            product.destroy
           end
          end

          
          { status: true, message: 'Xóa product thành công'}
          
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
          user = Product.find(params[:id]).user
          if product.present?
            { status: true, code: 200, data: ProductEntity.new(product)}
          else
            { status: false, code: 404, message: product.errors.full_messages.to_sentence}
          end

          
        end


      end

    end
  end
end
