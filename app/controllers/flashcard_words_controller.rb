class FlashcardWordsController < ApplicationController
  def update
    @flashcard_word = FlashcardWord.find(params[:id])
    @flashcard_word.update(flashcard_word_params)
  end

  private

  def flashcard_word_params
    params.require(:flashcard_word).permit(:studied)
  end
end
