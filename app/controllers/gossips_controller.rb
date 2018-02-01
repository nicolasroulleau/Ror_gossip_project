class GossipsController < ApplicationController
	before_action :set_gossip, only:[:show, :edit, :update, :destroy]

	def index
		@gossips = Gossip.all
	end

	def new
  		@gossip = Gossip.new
	end

	def create
		@gossip = Gossip.new(gossip_params)
		@gossip.save
		redirect_to @gossip
	end

	def gossip_params
		params.require(:gossip).permit(:anonymous_author, :content)
	end

	def show
  		@gossip = Gossip.find(params[:id])
	end

	def edit
	@gossip = Gossip.find(params[:id])
	end 

	def update
  	@gossip = Gossip.find(params[:id])
 	@gossip.update(gossip_params)
    redirect_to @gossip
  	end

  	def destroy
  		@gossip.destroy
  		redirect_to gossips_path
  	end

  	def set_gossip
  		@gossip = Gossip.find(params[:id])
  	end


end
