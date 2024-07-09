json.question do
  json.id @question.id
  json.body @question.body
  json.views_count @question.views_count
  json.answers_count @question.answers.length
  json.like_count @likes_count[@question]
  json.liked current_user ? @question.likes.exists?(user_id: current_user.id) : false
  json.author do
    json.id @question.author.id
    json.email @question.author.email
    json.nickname @question.author.nickname
    json.role @question.author.role
    json.is_banned @question.author.is_banned
    json.gravatar_hash @question.author.gravatar_hash
  end
  json.tags @question.tags do |tag|
    json.id tag.id
    json.title tag.name
  end
  json.positions @question.positions do |position|
    json.id position.id
    json.title position.title
    json.image_filename position.image_filename
  end
end
