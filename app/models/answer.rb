class Answer < ActiveRecord::Base
  belongs_to :taken_survey
  belongs_to :question
  belongs_to :possibility
  validates :possibility, presence: :true
end
