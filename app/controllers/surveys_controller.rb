get '/surveys/new' do
  survey = Survey.new()
  if request.xhr?
    erb :'surveys/new', layout: false
  else
    erb :'surveys/new'
  end
end

post '/surveys' do
  if current_user
    new_survey = current_user.surveys.new(title: params[:title], description: params[:description])
    if new_survey.save
      if request.xhr?
        erb :'questions/new', locals: {survey: new_survey}, layout: false
      else
        erb :'questions/new', locals: {survey: new_survey}
      end
    else
      if request.xhr?
        erb :'surveys/new', locals: {errors: new_survey.errors.full_messages}, layout: false
      else
        erb :'surveys/new', locals: {errors: new_survey.errors.full_messages}
      end
    end
  else
    if request.xhr?
      erb :'/sessions/new', locals: {error: "Please login first before doing that!"}, layout: false
    else
      erb :'/sessions/new', locals: {error: "Please login first before doing that!"}
    end
  end
end

get '/surveys' do
  surveys = Survey.where.not(maker: current_user)
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

get '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  erb :'/surveys/show', locals: {survey: survey}
end
