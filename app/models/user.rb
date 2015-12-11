class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "maker_id"
  has_many :taken_surveys, foreign_key: "taker_id"
end
