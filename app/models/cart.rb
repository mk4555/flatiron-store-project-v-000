class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = self.items.inject(0.00) {|sum, item| sum + item.price*(LineItem.find_by(cart_id: self.id).quantity) }
  end

  def add_item(item_id)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item_id)
    if line_item
      line_item.quantity += 1
      self.line_items << line_item
      line_item
    else
      LineItem.new(cart_id: self.id, item_id: item_id)
    end
  end
end
