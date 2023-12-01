class CreateJournalRecs < ActiveRecord::Migration[7.1]
  def change
    create_table :journal_recs do |t|
      t.string :surname
      t.string :group
      t.integer :mark1
      t.integer :mark2
      t.integer :mark3

      t.timestamps
    end
  end
end
