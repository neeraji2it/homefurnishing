class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.string :first_name
      t.string :last_name
      t.text :address
      t.text :landmark
      t.string :pincode
      t.string :city
      t.string :state
      t.string :country
      t.text :phone
      t.string :ip_address

      t.timestamps
    end
  end
end