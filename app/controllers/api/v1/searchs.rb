module API
  module V1
    class Searchs < Grape::API
      
      resource :searchs do
        desc 'Autocomplete search theo keyword'
        params do
          optional :keyword, type: String
        end
        
        get :autocompletes do
          Product.where("title like ?", "%#{params[:keyword]}%").limit(10)
        end
        
        desc 'Search products'
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

          {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: products,
            aggs: Product.fake_aggs
          }
        end

      end

    end
  end
end
