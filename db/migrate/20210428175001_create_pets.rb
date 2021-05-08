class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :owner, null: false
      t.string :name
      t.string :pet_type
      t.string :breed
      t.string :color
      t.string :sex
      t.integer :age
      t.text :care_instructions

      t.timestamps
    end
  end
end
