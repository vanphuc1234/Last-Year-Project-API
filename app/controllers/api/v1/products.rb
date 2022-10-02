module API
  module V1
    class Products < Grape::API
      
      resource :products do
        desc 'Return all products.'
        get do
          products = Product.paginate(page: params[:page])
          {
            total_count: products.total_entries,
            total_pages: products.total_pages,
            page: products.current_page,
            per_page: products.per_page,
            results: products
          }
        end
      end

    end
  end
end
