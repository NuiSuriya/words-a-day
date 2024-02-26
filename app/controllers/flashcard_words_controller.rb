class FlashcardWordsController < ApplicationController
  def update
    @flashcard_word = FlashcardWord.find(params[:id])
    @flashcard_word.update(flashcard_word_params)
    redirect_to flashcard_path(@flashcard_word.flashcard)
  end

  private

  def flashcard_word_params
    params.require(:flashcard_word).permit(:studied)
  end
end
