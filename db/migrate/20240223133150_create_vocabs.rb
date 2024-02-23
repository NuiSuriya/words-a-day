class CreateVocabs < ActiveRecord::Migration[7.1]
  def change
    create_table :vocabs do |t|
      t.string :word
      t.string :part_of_speech
      t.text :definition

      t.timestamps
    end
  end
end
