class CreateFlashcardWords < ActiveRecord::Migration[7.1]
  def change
    create_table :flashcard_words do |t|
      t.references :flashcard, null: false, foreign_key: true
      t.references :vocab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
