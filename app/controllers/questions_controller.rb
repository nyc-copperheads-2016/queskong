post '/surveys/:id/questions' do
  current_survey = Survey.find_by(id: params[:id])
  new_question = current_survey.questions.new(content: params[:content])
  if new_question.save && !Possibility.parse_possibilities(new_question, params[:possibilities]).empty?
    Possibility.save_possibilities
      if params[:done?] == "Done. Finish my survey"
        redirect "/"
      else
        erb :'questions/new', locals: {survey: current_survey}
      end
  else
    erb :'questions/new', locals: {survey: current_survey, errors: ["Questions must ask a question and have possible answers"] }
  end
end

get '/taken_surveys/:taken_survey_id/questions/:id' do
  current_taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  current_question = Question.find_by(id: params[:id])
  erb :'questions/show', locals: {current_taken_survey: current_taken_survey, current_question: current_question}
end
