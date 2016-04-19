require "rails_helper"

RSpec.describe Troll, :type => :model do
  it "has no troll in the begining" do
    expect(Troll.count).to eq 0
  end

  it "create one troll" do
  	troll = Troll.create!(name: "troll_one")
  	expect(Troll.count).to eq 1
  end

  it "can create troll without name" do
  	troll = Troll.create()
  	expect(troll).to be_valid
	end

	it "has many categories" do 
		category1 = Category.create(name: "category1")
		category2 = Category.create(name: "category2")
		troll1 = Troll.create()
		troll2 = Troll.create()
		troll1.category_trolls.create(category: category1)
		troll2.category_trolls.create(category: category2)
		expect(troll1.categories.count).to eq 1
		expect(troll2.categories.count).to eq 1
	end
end