class FlashcardWord < ApplicationRecord
  belongs_to :flashcard
  belongs_to :vocab
end
