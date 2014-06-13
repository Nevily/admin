class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :type 
 
      t.timestamps
    end
    
    add_index :videos, :url, unique: true
  end
end
