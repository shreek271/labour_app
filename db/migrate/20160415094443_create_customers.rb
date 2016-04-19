class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :gender
      t.string :country

      t.timestamps null: false
    end
  end
end
