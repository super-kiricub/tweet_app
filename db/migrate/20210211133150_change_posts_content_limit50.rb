class ChangePostsContentLimit50 < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :content, :text, limit: 50
  end
  def down
    change_column :posts, :content, :text
  end
end
