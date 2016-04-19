module ApplicationHelper

	def category_image(category)
		if category.trolls.present?
			category.trolls.last.image_url.present? ? category.trolls.last.image_url : asset_path('no-image.jpg')
		else
			asset_path('no-image.jpg')
		end
	end
end
