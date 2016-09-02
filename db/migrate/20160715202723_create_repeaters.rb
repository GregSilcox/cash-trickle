class CreateRepeaters < ActiveRecord::Migration[5.0]
  def change
    create_table :repeaters do |t|
      t.references :entry, foreign_key: true
      t.integer :frequency
      t.string :period

      t.timestamps
    end
  end
end
