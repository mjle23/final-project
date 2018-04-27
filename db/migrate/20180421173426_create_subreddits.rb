class CreateSubreddits < ActiveRecord::Migration[5.1]
  def change
    create_table :subreddits do |t|
      t.string :title
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
