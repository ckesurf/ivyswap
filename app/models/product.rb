# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  belongs_to :user
  #has_one :upload, dependent: destroy

  validates :description, presence: true, length: { maximum: 500 }
  validates :user_id, presence:true


  default_scope order: 'products.created_at DESC'
end

