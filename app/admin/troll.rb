ActiveAdmin.register Troll do

  permit_params :name, :image, :new_category, category_ids: []

  before_filter :set_category_if_any, only: [:create, :update]

	form do |f|
    f.inputs "Troll Details" do
      f.input :name
      f.input :image, :as => :file
		  f.input :category_ids, :label => "Categories", :hint => "multiselect categories", as: :select, 
              collection: Category.all(&:name), multiple: true
      f.input :new_category, :hint => "add new category with comma seperated values"
    end
    f.actions
  end

  controller do

    def set_category_if_any
      new_category_ids = []
      if params[:troll][:new_category].present?
        params[:troll][:new_category].split(',').each do |new_category|
          @category = Category.create(name: new_category)
          new_category_ids << @category.id
        end
      end
      params[:troll][:category_ids] << new_category_ids
      params[:troll][:category_ids] = params[:troll][:category_ids].flatten
    end

    def create
      @troll = Troll.new(permitted_params[:troll])
      if @troll.save
        redirect_to admin_troll_path(@troll), notice: "new troll created"
      else
        render :new
      end
    end

    def update
      @troll = Troll.find_by_id(params[:id])
      @troll.update(permitted_params[:troll])
      redirect_to admin_troll_path(@troll), notice: "troll updated"
    end
  end

  index do
    column :name
    column "Categories" do |troll|
      troll.categories.map{|category| "<a href=#{admin_category_path(category)}>#{category.name}</a>"}.join(' , ').html_safe
    end
    actions
  end

  show do
    attributes_table_for resource do
      row :name
      row('image') { image_tag(resource.image_url, :width => 100, :height => 100) }
      row('Categories') { resource.categories.map{|category| "<a href=#{admin_category_path(category)}>#{category.name}</a>"}.join(' , ').html_safe }
    end
  end
end
