class ChangePositionIdToCategoryId < ActiveRecord::Migration[6.1]
  def change
    rename_column :interview_questions, :position_id, :category_id
  end
end
