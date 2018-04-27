json.extract! comment, :id, :user_id, :post_id, :text, :upvotes, :downvotes, :created_at, :updated_at
json.url comment_url(comment, format: :json)
