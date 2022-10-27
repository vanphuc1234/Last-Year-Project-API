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
          new_products = products.map{|product| SearchEntity.new(product) }
          data = {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: new_products
          }

          {status: true, code: 200, data: data}
        end
        
        desc 'Up hình' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          optional :file, type: File, description: 'File'
        end

        post '/upload_image' do
          product_image = ProductImage.new(photo: params[:file])
          product_image.save
          if(product_image.valid?)
           return { status: true, code: 200, data: ProductImageEntity.new(product_image) }
          else return { status: false, code: 400, error: product_image.errors.full_messages.to_sentence}
          end
        end

        # desc 'Danh sách sản phẩm'

        # params do
        #   optional :page, type: Integer, description: 'Số trang'
        #   optional :per_page, type: Integer, description: 'Số dòng trên trang'
        #   optional :sort_by, type: String, values: ['id']
        #   optional :sort_order, type: String, values: ['asc', 'desc']
        # end

        # get do
        #   test_product_helper
        #   products = Product.paginate(page: page, per_page: per_page).order(order_by_hash)
        #   data = {
        #     total_count: products.total_entries,
        #     total_pages: products.total_pages,
        #     page: products.current_page,
        #     per_page: products.per_page,
        #     results: products
        #   }

        #   {status: true, code: 200, data: data}
        # end

        desc 'Đăng sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          optional :title, type: String, description: 'Tiêu đề'
          optional :description, type: String, description: 'Mô tả'
          optional :business_type, type: String, description: 'Loại giao dịch'
          optional :category_type, type: String, description: 'Loại BĐS'
          optional :price, type: Float, description: 'Giá'
          optional :area, type: Float, description: 'Diện tích'
          optional :city, type: String, description: 'Tỉnh/Thành phố'
          optional :district, type: String, description: 'Quận/Huyện'
          optional :ward, type: String, description: 'Phường/Xã'
          optional :street, type: String, description: 'Đường/Phố'
          optional :direction, type: String, description: 'Hướng'
          optional :beds_count, type: Integer, description: 'Số phòng ngủ'
          optional :baths_count, type: Integer, description: 'Số nhà tắm'
          optional :facade, type: Integer, description: 'Mặt tiền'
          optional :floor_count, type: Integer, description: 'Số tầng'
          optional :product_image_ids, type: String, description: 'Danh sách hình, ex: 1,2,3'
        end

        post do                     
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            product = Product.create(
              title: params[:title],
              description: params[:description],
              price: params[:price],
              area: params[:area],
              business_type: params[:business_type],
              category_type: params[:category_type],
              city: params[:city],
              district: params[:district],
              ward: params[:ward],
              street: params[:street],
              direction: params[:direction],
              beds_count: params[:beds_count],
              baths_count: params[:baths_count],
              facade: params[:facade],
              floor_count: params[:floor_count],
              user_id: user.id
            )
            if product.valid? && params[:product_image_ids].present?
              product.product_images.update_all(product_id: nil)
              image_ids = params[:product_image_ids].split(',')
              images = ProductImage.where(id: image_ids)
              images.update_all(product_id: product.id)
            end
            return { status: true, code: 200, data: ProductEntity.new(product)}
          else
            return { status: false, code: 404, message: "User không tồn tại"}
          end     
        end

        desc 'Cập nhật sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          # requires :id, type: Integer, description: 'Product id'
          optional :title, type: String, description: 'Tiêu đề'
          optional :description, type: String, description: 'Mô tả'
          optional :business_type, type: String, description: 'Loại giao dịch'
          optional :category_type, type: String, description: 'Loại BĐS'
          optional :price, type: Float, description: 'Giá'
          optional :area, type: Float, description: 'Diện tích'
          optional :city, type: String, description: 'Tỉnh/Thành phố'
          optional :district, type: String, description: 'Quận/Huyện'
          optional :ward, type: String, description: 'Phường/Xã'
          optional :street, type: String, description: 'Đường/Phố'
          optional :direction, type: String, description: 'Hướng'
          optional :beds_count, type: Integer, description: 'Số phòng ngủ'
          optional :baths_count, type: Integer, description: 'Số nhà tắm'
          optional :facade, type: Integer, description: 'Mặt tiền'
          optional :floor_count, type: Integer, description: 'Số tầng'
          optional :product_image_ids, type: String, description: 'Danh sách hình, ex: 1,2,3'
          
        end

        put ":id" do    
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            product = Product.find(params[:id])

            if(product.present?)
              is_valid = product.update(
                title: params[:title],
                description: params[:description],
                price: params[:price],
                area: params[:area],
                business_type: params[:business_type],
                category_type: params[:category_type],
                city: params[:city],
                district: params[:district],
                ward: params[:ward],
                street: params[:street],
                direction: params[:direction],
                beds_count: params[:beds_count],
                baths_count: params[:baths_count],
                facade: params[:facade],
                floor_count: params[:floor_count]
              )

              if is_valid 
                product.product_images.update_all(product_id: nil)
                image_ids = params[:product_image_ids].to_s.split(',')
                images = ProductImage.where(id: image_ids)
                images.update_all(product_id: product.id)
              end

              return { status: true, code: 200, data: ProductEntity.new(product)}
            else return { status: false, code: 400, message: "Sản phảm không tồn tại"}
            end

            else
              return { status: false, code: 404, message: "User không tồn tại"}
          end
        end

        desc 'Xóa sản phẩm' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          requires :id, type: Integer, description: "Id sản phẩm sẽ xóa"
          
        end

        delete do   
                   
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
           product = Product.find_by(id: params[:id])
           product_image_ids = ProductImage.where(id: product.product_image_ids.split(","))
           if(product.present?)
            product.destroy
            product_image_ids.destroy_all
          
            return { status: true, code: 200, message: "Xóa product thành công"}
           else return { status: false, code: 400, message: "Sản phảm không tồn tại"}
           end
          else return { status: false, code: 400, message: "Người dùng không tồn tại"}
          end       
                    
        end


        desc 'Xem chi tiết sản phẩm'
        params do
        end

        # services modules
        # helpers x
        # presenters (decorators) x
        # serialize (marshal) | deserialize (unmarshal) v (entity = serializer) x
        get ":id" do
          product = Product.find_by(id: params[:id])
        
          if product.present?
            { status: true, code: 200, data: ProductEntity.new(product)}
          else
            { status: false, code: 404, message: 'Không tìm thấy dữ liệu'}
          end
        end

        desc 'Xem chi tiết sản phẩm không dùng entity' do 
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          requires :id, type: String, description: 'id sản phẩm'
        end

        # services modules
        # helpers x
        # presenters (decorators) x
        # serialize (marshal) | deserialize (unmarshal) v (entity = serializer) x
        get do
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            product = Product.find_by(id: params[:id])
        
            if product.present?
              return { status: true, code: 200, data: product}
            else
              return { status: false, code: 404, message: 'Không tìm thấy dữ liệu'}
            end
          else return { status: false, code: 404, message: "User không tồn tại"}
          end
        end


      end

    end
  end
end
