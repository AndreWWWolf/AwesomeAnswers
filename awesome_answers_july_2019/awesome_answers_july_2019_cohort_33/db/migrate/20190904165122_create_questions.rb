class CreateQuestions < ActiveRecord::Migration[5.2]
  # This fule was created when we generated the question
  # model

  # To run all your remaining migrations do:
  # rails db:migrate

  # To look at the status of migrations (whether they're
  # active or not) do:
  # rails db:migrate:status

  # To reverse the last migration, do:
  # rails db:rollback
  # https://edgeguides.rubyonrails.org/active_record_migrations.html
  def change
    create_table :questions do |t|
      # Automatically generate an `id` column
      # that auto-incrememnts and acts as our
      # primary key
      t.string :title # This creates a VARCHAR(255) column named "title"
      t.text :body # This creates a TEXT column named "body"

      t.timestamps
      # This will create two columns:
      # "created_at" and "updated_at" which will auto-update
    end
  end
end
