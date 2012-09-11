class JoinPostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts_tags, :id => false do |t|
      t.integer :post_id
      t.integer :tag_id
    end

    add_index :posts_tags, [:post_id, :tag_id]
    add_index :posts_tags, [:tag_id, :post_id]
  end
end
