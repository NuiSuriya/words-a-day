class FlashcardsController < ApplicationController
  def show
    @flashcard = Flashcard.find(params[:id])
    @vocabs = @flashcard.vocabs
  end
end
