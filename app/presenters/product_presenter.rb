class ProductPresenter < BasePresenter
  BUSINESS_TYPES = {
    rent: 'Cho thuê', 
    sell: "Bán"
  }.with_indifferent_access

  def formatted_business_type
    BUSINESS_TYPES[business_type] || 'N/A'
  end

  def formatted_price
    if (price >= 1000000 && price < 1000000000 ) 
      ntrieu = (price / 1000000).round(1)
      "#{ntrieu} triệu"
    elsif (price < 1000000)
      ntnghin = (price / 100000).round(1)
      "#{ntnghin} trăm nghìn"
    elsif (price >= 1000000000)
      nty = (price / 1000000000).round(1)
      "#{nty} tỷ"
    # else
    #   price
    end
  end

  def formatted_area
    "#{area.round(0)} m2"
  end

  def formatted_price_per_m2
    price_per_m2 = (price/1000)/area

    "#{price_per_m2.round(1)} nghìn/m2"
  end

  def full_address
    "#{street}, #{ward}, #{district}, #{city}"
  end


end
