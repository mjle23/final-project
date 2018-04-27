class Link < ApplicationRecord
  belongs_to :user
  belongs_to :subreddit

  validates :text, presence: true, length: { minimum: 5 }
end
