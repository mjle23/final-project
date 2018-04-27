class CreateUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.references :user
      t.references :comment, foreign_key: true
    end
  end
end
