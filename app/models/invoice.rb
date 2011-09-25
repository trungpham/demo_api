class Invoice < ActiveRecord::Base
  has_many :line_items
  belongs_to :customer
  belongs_to :user
end
