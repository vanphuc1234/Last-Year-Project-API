class ProductPresenter < BasePresenter
  BUSINESS_TYPES = {
    rent: 'Cho thuê', 
    sell: "Bán"
  }.with_indifferent_access

  CATEGORY_TYPES = {
    nha_rieng: 'Nhà riêng', 
    can_ho_chung_cu: "Căn hộ chung cư",
    nha_mat_pho: "Nhà mặt phố",
    biet_thu_lien_ke:"Biệt thự liền kề",
    dat_nen_du_an:"Đất nền dự án",
    dat: "Đất",
    trang_trai_khu_nghi_duong:"Trang trại, khu nghỉ dưỡng",
    nha_tro_phong_tro:"Nhà trọ, phòng trọ",
    van_phong:"Văn phòng",
    cua_hang_kiot:"Cửa hàng, ki-ốt",
    kho_nha_xuong:"Kho, nhà xưởng",
    bat_dong_san_khac:"Bất động sản khác"
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
        if(business_type == "rent")
          "#{ntrieu} tr/tháng"
        else 
          "#{ntrieu} triệu"
        end
        
      elsif (price < 1000000)
        ntnghin = (price / 1000).round(1)
        if(business_type == "rent")
          "#{ntnghin} k/tháng"
        else 
          "#{ntnghin} nghìn"
        end

      elsif (price >= 1000000000)
        nty = (price / 1000000000).round(1)
        if(business_type == "rent")
          "#{nty} tỷ/tháng"
        else 
          "#{nty} tỷ"
        end
      
      else
        if(business_type == "rent")
          "#{price} đ/tháng"
        else 
          "#{price} đồng"
        end
     
      end
    end
    
  end

  def formatted_area
    if area != nil
    "#{area.round(0)} m2"
    end
  end

  def formatted_price_per_m2
    if price != nil && area != nil && business_type == "sell"
    price_per_area = price/area

      if (price_per_area >= 1000000 && price_per_area < 1000000000 ) 
        price_per_m2 = (price_per_area / 1000000).round(1)
        "#{price_per_m2.round(1)} triệu/m2"
      elsif (price_per_area < 1000000)
        price_per_m2 = (price_per_area / 1000).round(1)
        "#{price_per_m2.round(1)} nghìn/m2"
      elsif (price_per_area >= 1000000000)
        price_per_m2 = (price_per_area / 1000000000).round(1)
        "#{price_per_m2.round(1)} tỷ/m2"
      else
      "#{price_per_area} đồng/m2"
      end
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
    if(title != nil)
      title.parameterize
    else
      "#{business_type} #{category_type}"
    end
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
    
    if(facade != nil)
      mat_tien = {
        "label": "Mặt tiền",
        "value": facade
      }
      detail_props.push(mat_tien)
    end
    
    if(floor_count != nil)
      so_tang = {
        "label": "Số tầng",
        "value": floor_count
      }
      detail_props.push(so_tang)
    end

    if(beds_count != nil)
      phong_ngu = {
        "label": "Số phòng ngủ",
        "value": beds_count
      }
      detail_props.push(phong_ngu)
    end

    if(baths_count != nil)
      phong_tam = {
        "label": "Số nhà vệ sinh",
        "value": baths_count
      }
      detail_props.push(phong_tam)
    end

    huong = {
      "label": "Hướng",
      "value": direction
    }
    detail_props.push(huong)
    detail_props   
  end

  def formatted_sizes
    if(area != nil && facade != nil)
      long = (area / facade).round(1)
      "#{facade} x #{long} m "
    else
      "-"
    end
    
  end

  def formatted_publish_at
    now = DateTime.now
    diff = now.to_i - created_at.to_datetime.to_i
    if(diff >= 0 && diff < 60)
      "#{diff} giây trước"  
    elsif(diff >= 60 && diff < 3600)
      "#{diff / 60} phút trước"  
    elsif(diff >= 3600 && diff < 86400)
      "#{diff / 3600} giờ trước" 
    elsif(diff >= 86400 && diff < 2592000)
      "#{diff / 86400} ngày trước" 
    elsif(diff >= 2592999 && diff < 31536000)
      "#{diff / 2592999} tháng trước" 
    else
      "#{diff / 31536000} năm trước" 
    end     
  end

  def ll
    [lat, lon]
  end


end
