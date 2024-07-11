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
  json.answers @question.answers do |answer|
    json.id answer.id
    json.body answer.body
    json.liked current_user ? answer.likes.exists?(user_id: current_user.id) : false
    json.like_count answer.likes.size
    json.author do
      json.id answer.author.id
      json.email answer.author.email
      json.nickname answer.author.nickname
      json.role answer.author.role
      json.is_banned answer.author.is_banned
      json.gravatar_hash answer.author.gravatar_hash
    end
  end
end
