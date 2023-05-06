module API::V1::Helpers::ProductAPIHelpers
  extend Grape::API::Helpers
  
  def test_product_helper
    p "test_product_helpertest_product_helpertest_product_helper"
  end

  def client_view_bounds
    @client_view_bounds ||= begin
      client_bounds = JSON.parse(params[:bounds]) rescue []
      view_bounds = [client_bounds['sw'], client_bounds['ne']]
    end
  end
end
