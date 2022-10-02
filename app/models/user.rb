class User < ApplicationRecord

  def self.generate_data
    20.times do |index|
      Product.create(title: "Product - #{index}", description: "Description #{index}")
    end
  end

end
