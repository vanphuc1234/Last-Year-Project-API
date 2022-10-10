class ProfileEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
  expose :id
  expose :slug do |object|
    ProfilePresenter.new(object).slug
  end 
  expose :full_name
  expose :avatar_url
  expose :job_title
  expose :phone
  expose :profile_tag do |object|
    ProfilePresenter.new(object).profile_tag
  end
  expose :posts_count do |object|
    ProfilePresenter.new(object).posts_count
  end
  expose :description
  expose :formatted_joined_at do |object|
    "Đã tham gia hơn 1 tháng trước"
  end 
  
end
