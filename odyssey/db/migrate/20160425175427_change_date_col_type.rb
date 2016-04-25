class ChangeDateColType < ActiveRecord::Migration
  def up
    change_column :days, :date, :date
  end

  def down
    change_column :days, :date, :string
  end
end
