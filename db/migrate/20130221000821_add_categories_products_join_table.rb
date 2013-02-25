class AddCategoriesProductsJoinTable < ActiveRecord::Migration
  def up
  	create_table :categories_products, :id => false do |t|
  		t.integer :categories_id
  		t.integer :product_id
  	end
  end

  def down
  	drop_table :categories_products
  end
end
