class Bookmark < ApplicationRecord
  belongs_to :vocab
  belongs_to :wordbank
end
