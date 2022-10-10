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
  
  end
  