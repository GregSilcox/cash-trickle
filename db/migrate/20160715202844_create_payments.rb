class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :repeater, foreign_key: true
      t.datetime :due_on
      t.datetime :pay_on
      t.datetime :paid_on

      t.timestamps
    end
  end
end
