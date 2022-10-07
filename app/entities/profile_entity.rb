class ProfileEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.iso8601 }
  
  expose :id
  expose :full_name
  expose :avatar_url
  expose :username
end
