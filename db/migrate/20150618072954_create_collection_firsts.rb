class CreateCollectionFirsts < ActiveRecord::Migration
  def change
    create_table :collection_firsts do |t|
      t.text :content
      t.integer :percent
      t.integer :offer_parent

      t.timestamps
    end
  end
end
