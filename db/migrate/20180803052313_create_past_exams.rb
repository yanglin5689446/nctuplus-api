class CreatePastExams < ActiveRecord::Migration[5.0]
  def change
    create_table :past_exams do |t|
      t.string :description
      t.integer :download_count, default: 0
      t.string :file
      t.references :uploader, references: :users, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
