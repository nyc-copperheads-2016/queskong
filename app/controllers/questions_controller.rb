post '/surveys/:id/questions' do
  current_survey = Survey.find_by(id: params[:id])
  new_question = current_survey.questions.new(content: params[:content])
  if new_question.save
    Possibility.parse_possibilities(new_question, params[:possibilities])
        if params[:done?] == "Done. Finish my survey"
          redirect "/"
        else
          erb :'questions/new', locals: {survey: current_survey}
        end
  else
    erb :'questions/new', locals: {survey: current_survey, errors: survey.errors.full_messages}
  end
end
