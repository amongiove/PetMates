class CombineDateAndTimeColumnsInJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column(:jobs, :date)
    remove_column(:jobs, :time)
    add_column(:jobs, :date_time, :datetime) 
  end
end
