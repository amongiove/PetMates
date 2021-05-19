class ChangeRateToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :rate, :integer)
  end
end
