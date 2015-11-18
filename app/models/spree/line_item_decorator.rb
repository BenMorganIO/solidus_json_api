Spree::LineItem.class_eval do
  before_save -> { order.send :validate_line_item_availability }
end
