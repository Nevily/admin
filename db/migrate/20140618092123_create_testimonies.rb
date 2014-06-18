class CreateTestimonies < ActiveRecord::Migration
  def change
    drop_table :testimonies
    create_table :testimonies do |t|
      t.string :autor
      t.text :content
      t.integer :post_id

      t.timestamps
    end
  end
end
