class ProfilePresenter < BasePresenter
   
  def slug
    "#{phone}-i#{id}"
  end
  
  def profile_tag     
    profile_tag = []
    if type_user != nil 
    profile_tag.push(type_user)
    end
    if experience_year != nil
    profile_tag.push("#{experience_year} năm kinh nghiệm")
    end
    profile_tag    
   end

   def posts_count
    Product.where(user_id: id).count
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
  
  end
  