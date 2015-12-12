
post '/taken_surveys/:taken_survey_id/answers' do
  current_question = Question.find_by(id: params[:question_id])
  current_taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  possibility_chosen = Possibility.find_by(id: params[:possibility_id])


  new_answer = current_question.answers.new(possibility: possibility_chosen, taken_survey: current_taken_survey)

  if new_answer.save
    next_question = Question.find_by(id: current_taken_survey.survey.next_question_id(current_question.id))
    if next_question == nil
      redirect "/taken_surveys/#{current_taken_survey.id}"
    elsif request.xhr?
      erb :'questions/show', layout: false, locals: {current_taken_survey: current_taken_survey, current_question: next_question }
    else
      redirect "/taken_surveys/#{current_taken_survey.id}/questions/#{next_question.id}"
    end
  else
    erb :'questions/show',layout: !request.xhr?, locals: {current_taken_survey: current_taken_survey, current_question: current_question, errors: new_answer.errors.full_messages}
  end
end
