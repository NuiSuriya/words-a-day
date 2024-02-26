class AddStudiedToFlashcardWords < ActiveRecord::Migration[7.1]
  def change
    add_column :flashcard_words, :studied, :boolean, default: false
  end
end
