class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :payee
      t.decimal :amount
      t.references :repeater, foreign_key: true
      t.integer :due_on
      t.integer :pay_on
      t.integer :paid_on

      t.timestamps
    end
  end
end
