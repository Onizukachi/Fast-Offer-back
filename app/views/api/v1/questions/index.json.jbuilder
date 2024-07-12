json.questions @questions do |question|
  json.id question.id
  json.body question.body
  json.views_count question.views_count
  json.answers_count question.answers.size
  json.like_count question.likes.size
  json.liked current_user ? question.likes.any? { |like| like.user_id == current_user.id } : false
  # Оптимизация рендеринга автора
  json.author do
    json.id question.author.id
    json.email question.author.email
    json.nickname question.author.nickname
    json.role question.author.role
    json.is_banned question.author.is_banned
    json.gravatar_hash question.author.gravatar_hash
  end
  json.tags question.tags, :id, :name
  json.positions question.positions, :id, :title, :image_filename
end
