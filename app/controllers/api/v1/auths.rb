module API
  module V1
    class Auths < Grape::API
      helpers API::V1::Helpers::APIHelpers

      resource :auths do
        desc 'Đăng kí tài khoản'
        params do
          optional :full_name, type: String, description: 'Full name'
          requires :username, type: String, description: 'Username'
          requires :password, type: String, description: 'Password'
        end

        post :register do
          # 1. username phải là duy nhất
          # 2. password phải dài hơn 6 kí tự
          if (params[:password].to_s.length < 6) 
            return { status: false, message: "Password phải hơn 6 kí tự" }
          end

          password = Digest::MD5.hexdigest(params[:password])
          user = User.create(
            username: params[:username], 
            password: password, 
            full_name: params[:full_name]
          )

          if user.valid?
            { status: true, data: user }
          else
            { status: false, message: user.errors.full_messages.to_sentence}
          end
        end

        desc 'Cập nhật tài khoản' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end
        params do
          optional :type_user, type: String, description: 'Bạn là'
          optional :full_name, type: String, description: 'Họ và tên'
          optional :avatar_url, type: String, description: 'Ảnh đại diện'
          optional :job_title, type: String, description: 'Chức danh'
          optional :phone, type: Integer, description: 'Số điện thoại'
          optional :sex, type: String, description: 'Giới tính'
          optional :experience_year, type: String, description: 'Số năm kinh nghiệm'
          optional :description, type: String, description: 'Giới thiệu về bạn'
          optional :address, type: String, description: 'Nơi làm việc'
          
          
        end

        put do    
          user = User.find_by(api_token: headers['Authorization'])
          if(user.present?)
            

              user.update(
                type_user: params[:type_user],
                full_name: params[:full_name],
                avatar_url: params[:avatar_url],
                job_title: params[:job_title],
                phone: params[:phone],
                sex: params[:sex],
                experience_year: params[:experience_year],
                description: params[:description],
                address: params[:address],
              )
               return { status: true, code: 200, data: ProfileEntity.new(user)}
            else
              return { status: false, code: 404, message: "User không tồn tại"}
          end
        end

        desc 'Đăng nhập tài khoản'
        params do
          requires :username, type: String, description: 'Username'
          requires :password, type: String, description: 'Password'
        end

        post :login do
          password = Digest::MD5.hexdigest(params[:password])
          user = User.find_by(username: params[:username], password: password)
          if user.present?
            { success: true,  user: user }
          else
            { success: false, message: 'Username hoặc password không đúng.' }
          end
        end

        desc 'Thông tin của user đang đăng nhập' do
          headers API::V1::Helpers::APIHelpers.user_auth
        end

        get :me do
          user = User.find_by(api_token: headers['Authorization'])
          if user.present?
            { status: true, code: 200, data: ProfileEntity.new(user) }
          else
            { status: false, code: 401, message: 'API token không tồn tại' }
          end
        end

        
        desc 'Sản phẩm user đã đăng'
        params do
          requires :slug, type: String
          optional :business_type, type: String
          optional :category_type, type: String
          optional :city, type: String
          optional :district, type: String
          optional :ward, type: String
          optional :street, type: String
          optional :project, type: String
          optional :min_price, type: Float
          optional :max_price, type: Float
          optional :price_unit, type: String
          optional :min_area, type: Integer
          optional :max_area, type: Integer
          optional :direction, type: String
          optional :beds_count, type: Integer
          optional :baths_count, type: Integer
          optional :page, type: Integer, description: 'Số trang'
          optional :per_page, type: Integer, description: 'Số dòng trên trang'
          optional :sort_by, type: String, values: ['id']
          optional :sort_order, type: String, values: ['asc', 'desc']
        end
      
        get ":slug" do
          order_by_hash = {}
          sort_by = params[:sort_by] || 'id'
          sort_order = params[:sort_order] || 'desc'
          order_by_hash[sort_by] = sort_order

          user_id_slug = params[:slug].split('-i')
          

          products = Product.where(user_id: user_id_slug[1])
          
          if params[:business_type].present?
            products = products.where(business_type: params[:business_type])
          end

          if params[:category_type].present?
            products = products.where(category_type: params[:category_type])
          end

          if params[:min_price].present?
            products = products.where('price >= :min_price', {min_price: params[:min_price]})
          end

          if params[:max_price].present?
            products = products.where('price <= :max_price', {max_price: params[:max_price]})
          end

          if params[:min_area].present? && params[:max_area].present?
            products = products.where('area >= :min_area AND area <= :max_area', {min_area: params[:min_area], max_area: params[:max_area] })
          end

          if params[:direction].present?
            products = products.where(direction: params[:direction])
          end

          if params[:beds_count].present?
            products = products.where('beds_count = :beds_count', {beds_count: params[:beds_count]})
          end

          if params[:baths_count].present?
            products = products.where('baths_count = :baths_count', {baths_count: params[:baths_count]})
          end
          

          products = products.paginate(page: params[:page], per_page: params[:per_page]).order(order_by_hash)
          
          new_products = products.map{|product| SearchEntity.new(product) }
          data = {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: new_products,
            aggs: Product.fake_aggs
          }
          
          if products.present?
            { status: true, code: 200, data: data}
          else
            { status: false, code: 404, message: products.errors.full_messages.to_sentence}
          end


        end

      end

    end
  end
end
