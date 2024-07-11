json.id answer.id
json.body answer.body
json.liked current_user ? answer.likes.exists?(user_id: current_user.id) : false
json.like_count answer.likes.size
json.author do
  json.partial! 'api/v1/users/user', user: answer.author
end
json.comments answer.comments, partial: 'api/v1/comments/comment', as: :comment
