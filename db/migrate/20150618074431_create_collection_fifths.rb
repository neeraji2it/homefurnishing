class CreateCollectionFifths < ActiveRecord::Migration
  def change
    create_table :collection_fifths do |t|
      t.text :content
      t.integer :percent
      t.integer :offer_parent
      t.attachment :image
      t.text :additional
      t.timestamps
    end
  end
end
