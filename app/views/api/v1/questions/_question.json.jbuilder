json.id question.id
json.body question.body
json.views_count question.views_count
json.answers_count question.answers.length
json.like_count question.likes.size
json.liked current_user ? question.likes.exists?(user_id: current_user.id) : false
json.author { json.partial! question.author }
