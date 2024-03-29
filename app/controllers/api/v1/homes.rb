module API
    module V1
      class Homes < Grape::API
        resource :homes do
          desc 'trang chủ'
          params do
          end
          get do       
            products = Product.all

          banner = [
            {
              "image_url": "https://i.imgur.com/MobxNWF.jpg",
              "action_type": "popup_static_content",
              "options": {
                "str_rows": [
                  "Dòng 1",
                  "Dòng 2",
                  "Dòng 3"
                ]
              }
            },
            {
              "image_url": "https://via.placeholder.com/320x200?text=open_browser_by_url",
              "action_type": "open_browser_by_url",
              "options": {
                "url": "https://www.facebook.com/yenlinh1991/posts/pfbid02mPmJwSYPkiA5d2vr6bC9YA6Y79WPLFhKP47JirBENEqz5AiJc2VSqw6isj7iGv5Ul"
              }
            },
            {
              "image_url": "https://via.placeholder.com/320x200?text=push_screen",
              "action_type": "push_screen",
              "options": {
                "path": "/searchPage",
                "params": {
                }
              }
            }
          ]
          main_features = [
            "SearchBDS",
          ]
          balance= nil
          secondary_features = [
            {
              "name": "TopMoiGioiSell",
            },
            {
              "name": "TopMoiGioiRent",
            }
          ]
          {banners: banner, main_features: main_features, balance: balance, secondary_features: secondary_features }
          end
      
          
          
  
          desc 'Top môi giới' do
          end
          params do
          optional :business_type, type: String, values: ['rent', 'sell'], default: 'sell'
          end
          get :top_moi_gioi do
            results = User.joins(:products).where('business_type == :business_type', {business_type: params[:business_type]}).group(:user_id).order('COUNT(user_id) DESC').limit(5)   
            entity = results.map{|user| ProfileEntity.new(user)}
            entity
          end
        end
  
      end
    end
  end
  