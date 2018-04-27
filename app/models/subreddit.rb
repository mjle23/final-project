class Subreddit < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :category, presence: true, inclusion: { in: ['top', 'new', 'hot'] }
end
