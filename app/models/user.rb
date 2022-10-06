class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :full_name, presence: true
end
