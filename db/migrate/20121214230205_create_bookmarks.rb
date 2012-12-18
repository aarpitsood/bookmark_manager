class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.text   :tag
      t.string :username

      t.timestamps
    end
    add_index :bookmarks, :id
  end
end
