module API
  module V1
    class Searchs < Grape::API
      
      resource :searchs do
        desc 'Autocomplete search theo keyword'
        params do
          optional :keyword, type: String
        end
        
        get :autocompletes do
          if(params[:keyword] != " ")
            products = Product.where("title like ?", "%#{params[:keyword]}%")
          end
          if products.present?
            new_products = products.map{|product| SearchEntity.new(product)}
            { status: true, code: 200, data: new_products}
          else
            { status: false, code: 404, message: 'No data'}
          end
        end
        
        desc 'Danh sách sản phẩm'
        params do
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
      
        get do
          order_by_hash = {}
          sort_by = params[:sort_by] || 'id'
          sort_order = params[:sort_order] || 'desc'
          order_by_hash[sort_by] = sort_order

          products = Product.all
          if params[:business_type].present?
            products = products.where(business_type: params[:business_type])
          end

          if params[:category_type].present?
            products = products.where(category_type: params[:category_type])
          end

          if(params[:price_unit].present? && params[:min_price].present? && params[:max_price].present?)
            if(params[:price_unit] == "trieu")            
              products = products.where('price >= :min_price AND price <= :max_price', {min_price: params[:min_price]*1000000, max_price: params[:max_price]*1000000})
          
            elsif(params[:price_unit] == "ty")
              products = products.where('price >= :min_price AND price <= :max_price', {min_price: params[:min_price]*1000000000, max_price: params[:max_price]*1000000000})
            end
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
            { status: false, code: 404, message: 'No data'}
          end


        end

      end

    end
  end
end
