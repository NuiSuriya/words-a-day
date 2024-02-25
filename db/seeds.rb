# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# https://dictionaryapi.dev
# require 'httparty'
puts "Deleting all users"
User.destroy_all
puts "Deleting all flashcards"
Flashcard.destroy_all

technology_words = ["Algorithm", "Database", "Software", "Interface", "Programming", "Cybersecurity", "Encryption"]
# work_words = ["Work", "Job", "Career", "Employment", "Occupation", "Profession", "Vocation", "Trade", "Craft", "Business"]
puts "Creating users"
user1 = User.create!(email: "nui@mail.com", password: "password")
puts "Creating flashcards"
technology = Flashcard.create!(name: "Technology", user: user1)

technology_words.each do |word|
  url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
  reponse = HTTParty.get(url)
  data = JSON.parse(reponse.body)
  word = data[0]["word"]
  meanings = data[0]["meanings"]

  puts "Creating vocabs"
  vocabs = meanings.map do |meaning|
    part_of_speech = meaning["partOfSpeech"]
    definition = meaning["definitions"][0]["definition"]
    Vocab.create!(
      word: word,
      part_of_speech: part_of_speech,
      definition: definition
    )
  end

  puts "Creating flashcard words"
  vocabs.each do |w|
    FlashcardWord.create!(flashcard: technology, vocab: w)
  end
end
