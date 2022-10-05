module API::V1::Helpers::APIHelpers
  extend Grape::API::Helpers
  
  DEFAULT_PER_PAGE = 15

  def page
    params[:page].to_i > 0 ? params[:page].to_i : 1
  end

  def per_page
    params[:per_page].to_i > 0 ? params[:per_page].to_i : DEFAULT_PER_PAGE
  end

  def order_by_hash
    result = {}
    sort_by = params[:sort_by] || 'id'
    sort_order = params[:sort_order] || 'desc'
    result[sort_by] = sort_order
    result
  end

end
