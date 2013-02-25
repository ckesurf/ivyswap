class AddCategpryIdColumnToProducts < ActiveRecord::Migration
  def self.up
  	add_column :products, :category_id, :int
  end

  def self.down
  	remove_column :products, :category_id
  end
end
