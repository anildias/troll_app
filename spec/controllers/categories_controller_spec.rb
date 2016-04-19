require "rails_helper"

RSpec.describe CategoriesController, :type => :controller do
  describe "GET index" do
    let!(:category1) { Category.create(name: "category1") }
    let!(:category2) { Category.create(name: "category2") }

    it "assigns @categories" do
      get :index
      categories = Category.page(1)
      expect(assigns(:categories)).to eq(categories)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "has a 200 status response code" do
      get :index
      expect(response.status).to eq(200)
    end

  end
end