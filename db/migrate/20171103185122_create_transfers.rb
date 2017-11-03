class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.integer :sender_id
      t.integer :recipient_id
      t.string :recipient
      t.string :transfer_channel

      t.timestamps
    end
  end
end
