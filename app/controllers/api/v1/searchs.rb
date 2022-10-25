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

        desc 'Search Overviews'
        params do
          
        end
        
        get :overviews do
          
        { "total_count":496747,
          "cat_id":1,
          "aggs":{ 
            "category_types":[{"params":{"category_type":"nha_rieng"},"text":"nha_rieng","count":132579},{"params":{"category_type":"dat"},"text":"dat","count":127637},{"params":{"category_type":"can_ho_chung_cu"},"text":"can_ho_chung_cu","count":93085},{"params":{"category_type":"nha_mat_pho"},"text":"nha_mat_pho","count":71481},{"params":{"category_type":"biet_thu_lien_ke"},"text":"biet_thu_lien_ke","count":35820},{"params":{"category_type":"dat_nen_du_an"},"text":"dat_nen_du_an","count":26648},{"params":{"category_type":"van_phong"},"text":"van_phong","count":2013},{"params":{"category_type":"kho_nha_xuong"},"text":"kho_nha_xuong","count":1974},{"params":{"category_type":"nha_tro_phong_tro"},"text":"nha_tro_phong_tro","count":1714},{"params":{"category_type":"trang_trai_khu_nghi_duong"},"text":"trang_trai_khu_nghi_duong","count":1283},{"params":{"category_type":"bat_dong_san_khac"},"text":"bat_dong_san_khac","count":1137},{"params":{"category_type":"cua_hang_kiot"},"text":"cua_hang_kiot","count":755}],"areas":[{"params":{"min_area":0,"max_area":30},"text":"\u003c 30 m2","count":760},{"params":{"min_area":30,"max_area":50},"text":"30-50 m2","count":46063},{"params":{"min_area":50,"max_area":60},"text":"50-60 m2","count":36348},{"params":{"min_area":60,"max_area":70},"text":"60-70 m2","count":37982},{"params":{"min_area":70,"max_area":80},"text":"70-80 m2","count":34933},{"params":{"min_area":80,"max_area":100},"text":"80-100 m2","count":59577},{"params":{"min_area":100,"max_area":120},"text":"100-120 m2","count":34028},{"params":{"min_area":120,"max_area":150},"text":"120-150 m2","count":31860},{"params":{"min_area":150,"max_area":200},"text":"150-200 m2","count":26481},{"params":{"min_area":200,"max_area":250},"text":"200-250 m2","count":14880}],"prices":[{"params":{"min_price":0,"max_price":300,"price_unit":"trieu"},"text":"\u003c 300 triệu","count":2233},{"params":{"min_price":1,"max_price":3,"price_unit":"trieu"},"text":"1-3 triệu","count":8},{"params":{"min_price":3,"max_price":5,"price_unit":"trieu"},"text":"3-5 triệu","count":15},{"params":{"min_price":5,"max_price":8,"price_unit":"trieu"},"text":"5-8 triệu","count":21},{"params":{"min_price":8,"max_price":10,"price_unit":"trieu"},"text":"8-10 triệu","count":19},{"params":{"min_price":10,"max_price":15,"price_unit":"trieu"},"text":"10-15 triệu","count":164},{"params":{"min_price":15,"max_price":20,"price_unit":"trieu"},"text":"15-20 triệu","count":137},{"params":{"min_price":20,"max_price":25,"price_unit":"trieu"},"text":"20-25 triệu","count":112},{"params":{"min_price":25,"max_price":40,"price_unit":"trieu"},"text":"25-40 triệu","count":160},{"params":{"min_price":40,"max_price":60,"price_unit":"trieu"},"text":"40-60 triệu","count":153},{"params":{"min_price":300,"max_price":500,"price_unit":"trieu"},"text":"300-500 triệu","count":4708},{"params":{"min_price":500,"max_price":800,"price_unit":"trieu"},"text":"500-800 triệu","count":12704},{"params":{"min_price":0,"max_price":1,"price_unit":"ty"},"text":"\u003c 1 tỷ","count":12514},{"params":{"min_price":1,"max_price":2,"price_unit":"ty"},"text":"1-2 tỷ","count":63084},{"params":{"min_price":2,"max_price":3,"price_unit":"ty"},"text":"2-3 tỷ","count":58007},{"params":{"min_price":3,"max_price":4,"price_unit":"ty"},"text":"3-4 tỷ","count":46680},{"params":{"min_price":4,"max_price":5,"price_unit":"ty"},"text":"4-5 tỷ","count":36070},{"params":{"min_price":5,"max_price":6,"price_unit":"ty"},"text":"5-6 tỷ","count":29893},{"params":{"min_price":6,"max_price":7,"price_unit":"ty"},"text":"6-7 tỷ","count":25460},{"params":{"min_price":7,"max_price":8,"price_unit":"ty"},"text":"7-8 tỷ","count":19916},{"params":{"min_price":8,"max_price":10,"price_unit":"ty"},"text":"8-10 tỷ","count":27646},{"params":{"min_price":10,"max_price":12,"price_unit":"ty"},"text":"10-12 tỷ","count":20361},{"params":{"min_price":12,"max_price":15,"price_unit":"ty"},"text":"12-15 tỷ","count":27108},{"params":{"min_price":15,"max_price":20,"price_unit":"ty"},"text":"15-20 tỷ","count":29304},{"params":{"min_price":20,"max_price":30,"price_unit":"ty"},"text":"20-30 tỷ","count":29518},{"params":{"min_price":30,"max_price":40,"price_unit":"ty"},"text":"30-40 tỷ","count":15576},{"params":{"min_price":40,"max_price":50,"price_unit":"ty"},"text":"40-50 tỷ","count":8774},{"params":{"min_price":50,"max_price":100,"price_unit":"ty"},"text":"50-100 tỷ","count":16051}],"cities":[{"params":{"city_id":2},"city_id":2,"count":164075},{"params":{"city_id":1},"city_id":1,"count":161313},{"params":{"city_id":3},"city_id":3,"count":19082},{"params":{"city_id":4},"city_id":4,"count":19020},{"params":{"city_id":5},"city_id":5,"count":14925},{"params":{"city_id":6},"city_id":6,"count":14838},{"params":{"city_id":7},"city_id":7,"count":11631},{"params":{"city_id":8},"city_id":8,"count":11012},{"params":{"city_id":14},"city_id":14,"count":10884},{"params":{"city_id":23},"city_id":23,"count":8798},{"params":{"city_id":10},"city_id":10,"count":8283},{"params":{"city_id":13},"city_id":13,"count":7041},{"params":{"city_id":9},"city_id":9,"count":4956},{"params":{"city_id":24},"city_id":24,"count":4272},{"params":{"city_id":12},"city_id":12,"count":3541},{"params":{"city_id":32},"city_id":32,"count":2845},{"params":{"city_id":18},"city_id":18,"count":2713},{"params":{"city_id":17},"city_id":17,"count":2695},{"params":{"city_id":29},"city_id":29,"count":2553},{"params":{"city_id":11},"city_id":11,"count":2486},{"params":{"city_id":19},"city_id":19,"count":2204},{"params":{"city_id":25},"city_id":25,"count":1716},{"params":{"city_id":16},"city_id":16,"count":1649},{"params":{"city_id":15},"city_id":15,"count":1367},{"params":{"city_id":36},"city_id":36,"count":903},{"params":{"city_id":31},"city_id":31,"count":868},{"params":{"city_id":44},"city_id":44,"count":819},{"params":{"city_id":20},"city_id":20,"count":782},{"params":{"city_id":28},"city_id":28,"count":658},{"params":{"city_id":26},"city_id":26,"count":651},{"params":{"city_id":49},"city_id":49,"count":598},{"params":{"city_id":53},"city_id":53,"count":583},{"params":{"city_id":50},"city_id":50,"count":572},{"params":{"city_id":38},"city_id":38,"count":563},{"params":{"city_id":42},"city_id":42,"count":526},{"params":{"city_id":22},"city_id":22,"count":499},{"params":{"city_id":34},"city_id":34,"count":494},{"params":{"city_id":43},"city_id":43,"count":445},{"params":{"city_id":33},"city_id":33,"count":428},{"params":{"city_id":37},"city_id":37,"count":362},{"params":{"city_id":45},"city_id":45,"count":362},{"params":{"city_id":21},"city_id":21,"count":303},{"params":{"city_id":56},"city_id":56,"count":300},{"params":{"city_id":46},"city_id":46,"count":260},{"params":{"city_id":27},"city_id":27,"count":246},{"params":{"city_id":40},"city_id":40,"count":239},{"params":{"city_id":54},"city_id":54,"count":181},{"params":{"city_id":30},"city_id":30,"count":171},{"params":{"city_id":35},"city_id":35,"count":161},{"params":{"city_id":51},"city_id":51,"count":120},{"params":{"city_id":39},"city_id":39,"count":113},{"params":{"city_id":41},"city_id":41,"count":105},{"params":{"city_id":47},"city_id":47,"count":103},{"params":{"city_id":52},"city_id":52,"count":87},{"params":{"city_id":48},"city_id":48,"count":53},{"params":{"city_id":60},"city_id":60,"count":28},{"params":{"city_id":55},"city_id":55,"count":26},{"params":{"city_id":57},"city_id":57,"count":21},{"params":{"city_id":61},"city_id":61,"count":16},{"params":{"city_id":58},"city_id":58,"count":7},{"params":{"city_id":62},"city_id":62,"count":6},{"params":{"city_id":63},"city_id":63,"count":5},{"params":{"city_id":59},"city_id":59,"count":4}]}}
         
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
