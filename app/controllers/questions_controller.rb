post '/surveys/:id/questions' do
  current_survey = Survey.find_by(id: params[:id])
  new_question = current_survey.questions.new(content: params[:content])
  array_of_possibility_objs_for_new_question = Possibility.parse_possibilities(new_question, params[:possibilities])
  if new_question.save && !array_of_possibility_objs_for_new_question.empty?
    array_of_possibility_objs_for_new_question.each do |possibility|
      possibility.save
    end
      if params[:done] == "Done"
        questions = current_survey.questions
        if request.xhr?
          erb :'/surveys/edit', locals: {questions: questions, current_survey: current_survey}, layout: false
        else
          erb :'/surveys/edit', locals: {questions: questions, current_survey: current_survey}
        end

      else
        if request.xhr?
          erb :'questions/new', locals: {survey: current_survey}, layout: false
        else
          erb :'questions/new', locals: {survey: current_survey}
        end
      end
  else
    if request.xhr?
      erb :'questions/new', locals: {survey: current_survey, errors: ["Questions must ask a question and have possible answers"] }, layout: false
    else
      erb :'questions/new', locals: {survey: current_survey, errors: ["Questions must ask a question and have possible answers"] }
    end
  end
end

get '/taken_surveys/:taken_survey_id/questions/:id' do
  current_taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  current_question = Question.find_by(id: params[:id])
  erb :'questions/show', locals: {current_taken_survey: current_taken_survey, current_question: current_question}
end
