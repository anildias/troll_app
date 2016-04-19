require "rails_helper"
require "spec_helper"

feature "Category Viewing", :type => :feature do

	let!(:category) { Category.create(name: "category1") }
	let!(:troll) { Troll.create() }
	let!(:category_troll) { category.category_trolls.create(troll: troll) }

	scenario "visits index page or root page" do
		visit '/'

		expect(page).to have_text("Category List")
		expect(page).to have_link("category1", href: category_path(category.id))
	end

	scenario "click on category should navigate to category page" do
		visit '/'
		click_link('category1')

		expect(page).to have_text("#{category.name}")
	end

	scenario "click on category should show respective category trolls" do
		visit '/'
		click_link('category1')

		expect(page).to have_content("Trolls in the category #{category.name}")
	end
end