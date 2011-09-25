class LineItem < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :amount
      t.string :description
      t.references :invoice
      t.timestamp :date
      t.timestamps
    end
  end

  def self.down
  end
end
