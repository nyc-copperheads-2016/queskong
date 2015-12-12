get '/surveys/new' do
  survey = Survey.new()
  erb :'surveys/new'
end

post '/surveys' do
  # Recieve the title and maker
  new_survey = current_user.surveys.new(title: params[:title], description: params[:description])
  if new_survey.save
    erb :'questions/new', locals: {survey: new_survey}
  else
    erb :'surveys/new', locals: {errors: new_survey.errors.full_messages}
  end
end
