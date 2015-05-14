class AddVisibleToBuyingGuides < ActiveRecord::Migration
  def change
    add_column :buying_guides, :visible, :boolean, :default => true
  end
end
