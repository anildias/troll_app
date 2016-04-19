require "rails_helper"

RSpec.describe Category, :type => :model do
  it "has no category in the begining" do
    expect(Category.count).to eq 0
  end

  it "create one category" do
  	category = Category.create!(name: "category_one")
  	expect(Category.count).to eq 1
  end

  it "cannot create category without name" do
  	category = Category.create()
  	expect(category).to_not be_valid
	end

	it "validates category name" do
		category1 = Category.new(name: "category1")
		category2 = Category.new(name: "")
		expect(category1.save!).to eq true
		expect { category2.save! }.to raise_error ActiveRecord::RecordInvalid
	end

	it "has many trolls" do 
		category1 = Category.create(name: "category1")
		category2 = Category.create(name: "category2")
		troll1 = Troll.create()
		troll2 = Troll.create()
		category1.category_trolls.create(troll: troll1)
		category2.category_trolls.create(troll: troll2)
		expect(category1.trolls.count).to eq 1
		expect(category2.trolls.count).to eq 1
	end
end