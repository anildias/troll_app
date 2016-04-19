class CategoryTroll < ActiveRecord::Base
	belongs_to :category
	belongs_to :troll
end
