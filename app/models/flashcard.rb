class Flashcard < ApplicationRecord
  belongs_to :user
  has_many :flashcard_words
  has_many :vocabs, through: :flashcard_words
end
