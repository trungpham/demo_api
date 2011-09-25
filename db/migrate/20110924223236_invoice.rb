class Invoice < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :invoice_number
      t.timestamp :invoice_date
      t.timestamp :due_date
      t.references :customer
      t.references :user
      t.timestamps
    end
  end

  def self.down
  end
end
