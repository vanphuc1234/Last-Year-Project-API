class ProductPresenter < BasePresenter
  BUSINESS_TYPES = {
    rent: 'Cho thuê', 
    sell: "Bán"
  }.with_indifferent_access

  CATEGORY_TYPES = {
    nha_rieng: 'Nhà riêng', 
    can_ho_chung_cu: "Căn hộ chung cư"
  }.with_indifferent_access

  def formatted_category_type
    CATEGORY_TYPES[category_type] || 'N/A'
  end

  def formatted_business_type
    BUSINESS_TYPES[business_type] || 'N/A'
  end

  def formatted_price
    if price != nil 
      if (price >= 1000000 && price < 1000000000 ) 
        ntrieu = (price / 1000000).round(1)
        "#{ntrieu} triệu"
      elsif (price < 1000000)
        ntnghin = (price / 1000).round(1)
        "#{ntnghin} nghìn"
      elsif (price >= 1000000000)
        nty = (price / 1000000000).round(1)
        "#{nty} tỷ"
      else
       "#{price} đồng"
      end
    end
    
  end

  def formatted_area
    if area != nil
    "#{area.round(0)} m2"
    end
  end

  def formatted_price_per_m2
    if price != nil && area != nil
    price_per_m2 = (price/1000)/area

    "#{price_per_m2.round(1)} nghìn/m2"
    end
  end

  def listing_location_name
    if district != nil && city == nil
      district
    elsif city != nil && district == nil
      city
    elsif city != nil && district != nil
      "#{district}, #{city}"
    else
        nil
    end
    
  end


  def props
    props = []
    if floor_count != nil 
      props.push("#{floor_count} tầng")
    end
    if beds_count != nil
      props.push("#{beds_count} pn")
    end
    if baths_count != nil
      props.push("#{baths_count} wc")
    end
    if facade != nil
      props.push("Mặt tiền #{facade} m")
    end
    if direction != nil
      props.push(direction)
    end
    props    
  end

  def slug 
    title.parameterize
  end 

  def full_address
    address = []
    if(street != nil)
      address.push(street)
    end
    if(ward != nil)
      address.push(ward)
    end
    if(district != nil)
      address.push(district)
    end
    if(city != nil)
      address.push(city)
    end
    
    address.join(', ')
  end

  def detail_props
    detail_props = []

    if(business_type!= nil && category_type != nil)
      loai_tin_dang = {
        "label": "Loại tin đăng",
        "value": "#{formatted_business_type} #{formatted_category_type.downcase}"
      }
      detail_props.push(loai_tin_dang)
    end
    if(street != nil || ward != nil || district != nil || city != nil)
      dia_chi = {
       "label": "Địa chỉ",
        "value": full_address
      }
      detail_props.push(dia_chi)
    end
    detail_props   
  end


end
