class TrollsController < ApplicationController

  def index
  	if params[:search]
			@term = params[:search]
			@trolls = Troll.search(@term, params[:page])
		else
	  	@trolls = Troll.page 1
		end
  end

  def show
  	@troll = Troll.find_by_id params[:id]
  end

end
