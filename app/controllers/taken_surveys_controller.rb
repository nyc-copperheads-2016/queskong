post '/taken_surveys' do
  survey_chosen = Survey.find_by(id: params[:survey_id])
  if current_user
    if current_user.id == survey_chosen.maker_id
      questions = survey_chosen.questions
      takers = survey_chosen.takers
      erb :'/surveys/stats', locals: {survey: survey_chosen, questions: questions, takers: takers }
    end
    new_taken_survey = current_user.taken_surveys.new(survey: survey_chosen)
    first_question_id = new_taken_survey.survey.next_question_id()
    if new_taken_survey.save
      redirect "/taken_surveys/#{new_taken_survey.id}/questions/#{first_question_id}"
    else
      erb :'surveys/index', locals: {error: "Something went wrong, buzz off!"}
    end
  else
    erb :'/sessions/new', locals: {error: "Please login first before doing that!"}
  end
end

get '/taken_surveys/:id' do
  erb :'taken_surveys/thanks', layout: !request.xhr?
end

