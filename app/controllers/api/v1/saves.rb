module API
    module V1
      class Saves < Grape::API
        resource :saves do
          
          desc 'Update product save' do
            headers API::V1::Helpers::APIHelpers.user_auth
          end
          params do
            requires :product_id, type: Integer, description: 'product_id'
            optional :action, type: String, values: ['save', 'unsave']
          end
          post do
            user = User.find_by(api_token: headers['Authorization'])
            product = Product.find_by(id: params[:product_id])
            if(user.present? && product.present?)
                if params[:action] == 'save' 
                    ids = Save.where(user_id: user.id).map{|save| save.product.id}
                    if(!(ids.include?(params[:product_id])))
                        save = Save.create(
                            user: user,
                            product: product
                        )
                        saved_ids = Save.where(user_id: user.id).map{|save| save.product.id}
                    end
                    data = {
                        "product_id": params[:product_id],
                        "saved_ids": saved_ids
                    }
                    return {status: true, code: 200, data: data}

                elsif params[:action] == 'unsave'
                        save = Save.find_by(
                            user: user,
                            product: product
                        )
                        if(save.present?)
                            save.destroy
                        end
                        saved_ids = Save.where(user_id: user.id).map{|save| save.product.id}
                    data = {
                        "product_id": params[:product_id],
                        "saved_ids": saved_ids
                    }
                    return {status: true, code: 200, data: data}
                end     
            else 
                return { status: false, code: 400, message: "Người dùng không tồn tại"}
            end
            
          end
        end
  
      end
    end
  end
  