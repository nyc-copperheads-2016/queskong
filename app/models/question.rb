class Question < ActiveRecord::Base
  has_many :possibilities
  belongs_to :survey
  has_many :answers

  validates :content, presence: :true
end
