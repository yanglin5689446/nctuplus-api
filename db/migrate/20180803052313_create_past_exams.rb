class CreatePastExams < ActiveRecord::Migration[5.0]
  def change
    create_table :past_exams do |t|
      t.timestamps
    end
  end
end
