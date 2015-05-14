class AddVisibleToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :visible, :boolean, :default => true
  end
end
