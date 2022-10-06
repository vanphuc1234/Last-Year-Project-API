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

      end

    end
  end
end
