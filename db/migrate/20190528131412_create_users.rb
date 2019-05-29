class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :employee_id
      t.string :firstname
      t.string :surname
      t.string :email
      t.integer :mobile_number
      t.bigint :card_number
      t.decimal :balance

      t.timestamps
    end
  end
end
