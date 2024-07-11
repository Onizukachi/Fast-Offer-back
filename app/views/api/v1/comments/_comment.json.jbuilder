json.id comment.id
json.body comment.body
json.commentable_id comment.commentable_id
json.commentable_type comment.commentable_type
json.author do
  json.partial! 'api/v1/users/user', user: comment.author
end
