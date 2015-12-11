class Survey < ActiveRecord::Base
  belongs_to :maker, class_name: "User"
  has_many :taken_surveys
  has_many :questions
  has_many :takers, through: :taken_surveys, source: :taker
end
