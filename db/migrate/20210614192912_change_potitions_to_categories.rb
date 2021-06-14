class ChangePotitionsToCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :positions, :categories
  end
end
