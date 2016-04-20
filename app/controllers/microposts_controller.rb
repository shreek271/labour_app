class MicropostsController < ApplicationController
	
	before_action :logged_in_customer, only: [:create, :destroy]
	before_action :correct_customer, only: :destroy
	
	def create
		@micropost = current_customer.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = " status updated "
			redirect_to root_url
		else
			@feed_items = []
			render 'main_pages/home'
		end 
	end

	def destroy
		@micropost.destroy
		flash[:success] = "post deleted"
		redirect_to request.referrer || root_url	
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, :photo)
	end

	def correct_customer
		@micropost = current_customer.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end

end
