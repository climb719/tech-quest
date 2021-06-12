class InterviewQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :position
  has_many :comments
  has_many users, through: :comments
end
