class CreateForeignKeys < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :category_id, :integer
    add_column :images, :post_id, :integer
    add_column :videos, :post_id, :integer
    add_column :testimonies, :post_id, :integer
  end
end
