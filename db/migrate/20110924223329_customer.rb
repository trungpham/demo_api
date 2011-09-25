class Customer < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.timestamps
    end
  end

  def self.down
  end
end
