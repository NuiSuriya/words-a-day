class Flashcard < ApplicationRecord
  belongs_to :user
  has_many :flashcard_vocabs
  has_many :vocabs, through: :flashcard_vocabs
end
