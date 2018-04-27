class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :upvotes
      t.integer :downvotes
      t.references :user, foreign_key: true
      t.references :subreddit, foreign_key: true

      t.timestamps
    end
  end
end
