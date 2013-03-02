class Category < ActiveRecord::Base
  attr_accessible :category_id, :name

  has_many :products

end
