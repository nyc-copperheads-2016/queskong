class Possibility < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  validates :choice, presence: :true

  def self.parse_possibilities(question, possibilities_string)
    possibilities = []
    possibilities_string.split(", ").each do |possibility|
      possibilities << question.possibilities.new(choice: possibility)
    end
    possibilities
  end

  def self.save_possibilities(question, possibilities_string)
    Possibility.parse_possibilities(question, possibilities_string).each do |possibility|
      possibility.save
    end
  end
end
