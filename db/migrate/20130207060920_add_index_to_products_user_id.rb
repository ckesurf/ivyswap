class AddIndexToProductsUserId < ActiveRecord::Migration
  def change
  	add_index :products, [:user_id, :created_at]
  end
end
