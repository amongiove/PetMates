class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :sitter, null: false
      t.references :owner, null: false
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
