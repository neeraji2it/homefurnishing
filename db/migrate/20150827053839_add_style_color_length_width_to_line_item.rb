class AddStyleColorLengthWidthToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :style, :string
    add_column :line_items, :fabric, :string
    add_column :line_items, :length, :float
    add_column :line_items, :width, :float
    add_column :line_items, :color, :string

  end
end
