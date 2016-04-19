ActiveAdmin.register Category do

	permit_params :name

  member_action :trolls, method: :get do
    @category = Category.find_by_id(resource.id)
    @trolls = @category.trolls
  end

  index do
    column :id
    column "name" do |resource|
      link_to resource.name, resource_path(resource)
    end
    column "Trolls count" do |resource|
      resource.trolls.length
    end
    column "Trolls List" do |resource|
      link_to 'trolls', trolls_admin_category_path(resource)
    end
    actions
  end

	show do
    attributes_table_for resource do
    	row :id
      row :name
      row('trolls count') { resource.trolls.length }
      row(' ') { link_to 'view all trolls', trolls_admin_category_path(resource) }
    end

    panel "Trolls" do
    	resource.trolls.each do |troll|
    		div image_tag(troll.image_url, :width => 100, :height => 100)
        h3 troll.name
    	end
  	end
  end
	
end
