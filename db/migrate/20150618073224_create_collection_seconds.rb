class CreateCollectionSeconds < ActiveRecord::Migration
  def change
    create_table :collection_seconds do |t|
      t.text :content
      t.integer :percent
      t.integer :offer_parent
      t.text :additional

      t.timestamps
    end
  end
end
