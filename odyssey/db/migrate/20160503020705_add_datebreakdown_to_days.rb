class AddDatebreakdownToDays < ActiveRecord::Migration
  def change
    add_column :days, :month, :integer
    add_column :days, :day, :integer
    add_column :days, :year, :integer
  end
end
