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

      end

    end
  end
end
