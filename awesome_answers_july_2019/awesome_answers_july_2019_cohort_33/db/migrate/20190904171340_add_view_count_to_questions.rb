class AddViewCountToQuestions < ActiveRecord::Migration[5.2]

  # This file was generated with the command:
  # rails g migration add_view_count_to_questions view_count:integer
  def change
    # Use add_column to add columns to a table.
    # Its arguments are (in order):
    # - the table's name as a symbol
    # - the new column's name as a symbol
    # - the type of the new column
    add_column :questions, :view_count, :integer
  end
end
