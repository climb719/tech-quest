class CreateInterviewQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_questions do |t|
      t.string :question
      t.text :answer
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
