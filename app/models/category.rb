class Category < ActiveRecord::Base
    serialize :subcategories,Array
end
