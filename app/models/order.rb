class Order < ActiveRecord::Base
   NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at","status"] #or any other attribute that does not need validation
  VALIDATABLE_ATTRS = Order.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
     validates_presence_of VALIDATABLE_ATTRS
end
