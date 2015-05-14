class AddVisibleToAdvices < ActiveRecord::Migration
  def change
    add_column :advices, :visible, :boolean, :default => true
  end
end
