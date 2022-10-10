class ProfilePresenter < BasePresenter
   
  def slug
    "#{phone}-i#{id}"
  end
  
  def profile_tag     
    profile_tag = []
    if job_title != nil 
    profile_tag.push(job_title)
    end
    if experience_year != nil
    profile_tag.push(experience_year)
    end
    profile_tag    
   end

   def posts_count
    Product.where(user_id: id).count
   end
  
  end
  