class Category < ApplicationRecord
    has_many :interview_questions

    scope :alphabetical, -> { order(:name) }
    scope :by_category, -> { group(:name) }
    #scope method intended to be chainable
    #chainable if returning active record relation 
    #whenever do association calls (ie category.interview_questions), returning active record relation c
    # add scope method - class level methods that limit the return to be a scope return - return some of the
    # questions - most commented, organize, sort by category, some questions only
    #validates :name, presence: true ?
end

