class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :vocab, null: false, foreign_key: true
      t.references :wordbank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
