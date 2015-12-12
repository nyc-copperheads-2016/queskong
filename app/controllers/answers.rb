
post '/taken_surveys/:taken_survey_id/answers' do
  current_question = Question.find_by(id: params[:question_id])
  current_taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  possibility_chosen = Possibility.find_by(id: params[:possibility_id])

  new_answer = possibility_chosen.answers.new(question: current_question, taken_survey: current_taken_survey)

  if new_answer.save
    next_question_id = current_taken_survey.survey.next_question_id(current_question.id)
    if next_question_id == nil
      redirect '/surveys'
    end
    redirect "/taken_surveys/#{current_taken_survey.id}/questions/#{next_question_id}"
  else
    erb :'questions/show', locals: {current_taken_survey: current_taken_survey, current_question: current_question}
  end
end
