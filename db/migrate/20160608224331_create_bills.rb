class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :payee
      t.decimal :amount
      t.string :note
      t.integer :due_on

      t.timestamps
    end
  end
end
