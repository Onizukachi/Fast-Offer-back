json.questions @questions do |question|
  json.partial! question
  json.tags question.tags, partial: 'api/v1/tags/tag', as: :tag
  json.positions question.positions, partial: 'api/v1/positions/position', as: :position
end
