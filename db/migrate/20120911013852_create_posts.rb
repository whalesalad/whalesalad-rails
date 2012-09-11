class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text   :body
      t.string :link

      t.timestamps
    end

    add_index :posts, :slug, :unique => true
  end
end
