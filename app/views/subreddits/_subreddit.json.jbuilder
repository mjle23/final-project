json.extract! subreddit, :id, :title, :type, :user_id, :created_at, :updated_at
json.url subreddit_url(subreddit, format: :json)
