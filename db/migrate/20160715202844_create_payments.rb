class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :who
      t.date :when
      t.decimal :amount
      t.references :repeater, foreign_key: true

      t.timestamps
    end
  end
end
