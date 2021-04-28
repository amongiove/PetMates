class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.text :content
      t.datetime :sent_time

      t.timestamps
    end
  end
end
