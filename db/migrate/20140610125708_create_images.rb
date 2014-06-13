class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :type 
 
      t.timestamps
    end
    
    add_index :images, :url, unique: true
  end
end
