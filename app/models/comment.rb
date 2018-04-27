class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :subreddit

  validates :text, presence: true, length: { minimum: 5 }
end
