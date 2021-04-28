class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :sitter, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
