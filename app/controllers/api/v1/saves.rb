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
                    end
                    saved_ids = Save.where(user_id: user.id).map{|save| save.product.id}
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


          desc 'Get products saved' do
            headers API::V1::Helpers::APIHelpers.user_auth
          end
          params do
            optional :page, type: Integer, description: 'Số trang'
            optional :per_page, type: Integer, description: 'Số dòng trên trang', default: 15
          end
          get do
            user = User.find_by(api_token: headers['Authorization'])
            products = Product.all
            if(user.present?)
              saveds = Save.where(user_id: user.id)
              ids = saveds.map{|saved| saved.product.id}

              products = products.where(id: ids)
              
              products = products.paginate(page: params[:page], per_page: params[:per_page])
              
              saved_products_entity = products.map{|product| SearchEntity.new(product)}

              data = {
                total_count: products.total_entries,
                total_pages: products.total_pages,
                page: products.current_page,
                per_page: products.per_page,
                results: saved_products_entity,
              }
              return { status: true, code: 200, data: data}
            else 
              return { status: false, code: 400, message: "Người dùng không tồn tại"}
            end
            
          end

          desc 'Get ids saved' do
            headers API::V1::Helpers::APIHelpers.user_auth
          end
          params do
          end
          get '/saved_ids' do
            user = User.find_by(api_token: headers['Authorization'])
            products = Product.all
            if(user.present?)
              saveds = Save.where(user_id: user.id)
              ids = saveds.map{|saved| saved.product.id}

             
              return { status: true, code: 200, data: ids}
            else 
              return { status: false, code: 400, message: "Người dùng không tồn tại"}
            end
            
          end


        end
  
      end
    end
  end
  