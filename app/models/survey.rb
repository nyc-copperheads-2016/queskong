class Survey < ActiveRecord::Base
  belongs_to :maker, class_name: "User"
  has_many :taken_surveys
  has_many :questions
  has_many :takers, through: :taken_surveys, source: :taker

  validates :title, presence: :true
  validates :description, presence: :true

  def next_question_id(current_question_id = "none")
    if current_question_id == "none"
      questions.first.id
    else
      next_index = questions.find_index{ |question| question.id == current_question_id } + 1
      if next_index == questions.length
        nil
      else
      next_id = questions[next_index].id
      end
    end
  end
end
