class PagesController < ApplicationController
  def home
  end

  def dashboard
    @flashcards = Flashcard.all
  end
end
