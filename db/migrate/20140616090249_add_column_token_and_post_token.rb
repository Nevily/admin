class AddColumnTokenAndPostToken < ActiveRecord::Migration
  def change
    add_column :posts, :token, :string
    add_column :images, :post_token, :string
  end
end
