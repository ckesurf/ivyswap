class AddCatsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cats, :string
  end
end
