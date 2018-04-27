class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subreddit
  has_many :comments, dependent: :destroy

  validates :text, presence: true, length: { minimum: 5 }
end
