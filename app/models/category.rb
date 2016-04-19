class Category < ActiveRecord::Base

	paginates_per 10

	validates :name, presence: true

	has_many :category_trolls, :dependent => :destroy
	has_many :trolls, through: :category_trolls

end
