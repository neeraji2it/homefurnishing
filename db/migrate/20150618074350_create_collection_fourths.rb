class CreateCollectionFourths < ActiveRecord::Migration
  def change
    create_table :collection_fourths do |t|
      t.text :content
      t.integer :percent
      t.integer :offer_parent
      t.attachment :image
      t.text :additional
      t.timestamps
    end
  end
end
