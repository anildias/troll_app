class Troll < ActiveRecord::Base

	paginates_per 10

	has_many :category_trolls
	has_many :categories, through: :category_trolls

	mount_uploader :image, ImageUploader

	accepts_nested_attributes_for :category_trolls

	def new_category
	end

	def new_category=(arg)
	end

	def self.search(search, page)
		trolls = []
	  trolls = where("name LIKE ?", "%#{search}%")
	  trolls << Category.where("name LIKE ?", "%#{search}%").collect{|cat| cat.trolls}
	  Kaminari.paginate_array(trolls.flatten.uniq).page.per(10)
	end

end
