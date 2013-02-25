class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :products, :cats
  end

  def down
  	add_column :products, :cats
  end
end
