class ProductPresenter < BasePresenter
  BUSINESS_TYPES = {
    rent: 'Cho thuê', 
    sell: "Bán"
  }.with_indifferent_access

  def formatted_business_type
    BUSINESS_TYPES[business_type] || 'N/A'
  end

  def formatted_price
    ntrieu = (price / 1000000).round(1)
    "#{ntrieu} triệu"
  end

  def formatted_area
    "#{area.round(0)} m2"
  end
end
