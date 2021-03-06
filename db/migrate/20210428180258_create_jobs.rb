class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :sitter, null: false
      t.references :owner, null: false
      t.date :date
      t.time :time
      t.text :specifics
      t.string :acceptance_status
      t.boolean :completion_status

      t.timestamps
    end
  end
end
