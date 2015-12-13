get '/surveys/new' do
  survey = Survey.new()
  erb :'surveys/new'
end

post '/surveys' do
  if current_user
    new_survey = current_user.surveys.new(title: params[:title], description: params[:description])
    if new_survey.save
      erb :'questions/new', locals: {survey: new_survey}
    else
      erb :'surveys/new', locals: {errors: new_survey.errors.full_messages}
    end
  else
    erb :'/sessions/new', locals: {error: "Please login first before doing that!"}
  end
end

get '/surveys' do
  surveys = Survey.all
  erb :'surveys/index', locals: {surveys: surveys}
end

get '/surveys/:id/edit' do
  current_survey = Survey.find_by(id: params[:id])
  questions = current_survey.questions
  erb :'/surveys/edit', locals: {questions: questions, current_survey: current_survey}
end

put '/surveys' do
  # needs logic to edit and update survey / questions / possibilities
  redirect "/"
end
