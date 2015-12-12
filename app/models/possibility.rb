class Possibility < ActiveRecord::Base
  belongs_to :question
  has_many :answers

  def self.parse_possibilities(question, possibilities)
    possibilities = possibilities.split(", ")
      possibilities.each do |possibility|
        question.possibilities.create(choice: possibility)
      end
  end
end
