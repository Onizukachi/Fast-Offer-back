json.questions @questions do |question|
  json.id question.id
  json.body question.body
  json.views_count question.views_count
  json.answers_count question.answers.length
  json.likes_count @likes_count[question]
  json.author do
    json.id question.author.id
    json.email question.author.email
    json.username question.author.username
    json.role question.author.role
    json.is_banned question.author.is_banned
    json.gravatar_hash question.author.gravatar_hash
  end
  json.tags question.tags do |tag|
    json.title tag.name
  end
end
