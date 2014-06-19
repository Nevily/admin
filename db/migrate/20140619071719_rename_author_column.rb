class RenameAuthorColumn < ActiveRecord::Migration
  def change
    change_table :testimonies do |t|
      t.rename :autor, :author
    end
  end
end
