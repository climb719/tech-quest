class InterviewQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  validates :question, :answer, presence: true 
  accepts_nested_attributes_for :category,  reject_if: proc { |attributes| attributes['name'].blank? }
end

