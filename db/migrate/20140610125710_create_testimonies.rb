class CreateTestimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.string :autor
      t.text :content 
 
      t.timestamps
    end
  end
end