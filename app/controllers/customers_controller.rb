class CustomersController < ApplicationController

  before_action :logged_in_customer, only: [:index, :edit, :update, :destroy,
                                            :following, :followers]
  before_action :correct_customer, only: [:edit, :update]
  before_action :admin_customer, only: :destroy

  def index
    @customer = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
    @microposts = @customer.microposts
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
      log_in @customer
  	    flash[:success] = "Welcome to the Sample App!"
  		redirect_to @customer
  	else
  		render 'new'
  	end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
       redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "profile deleted"
    redirect_to customers_url
  end

  def following
    @title = "Following"
    @customer  = Customer.find(params[:id])
    @customers = @customer.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @customer  = Customer.find(params[:id])
    @customers = @customer.followers
    render 'show_follow'
  end

  private

  def customer_params
  	params.require(:customer).permit(:name, :email, :dob, :gender,
  	   :country, :password, :password_confirmation)
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to (root_url) unless current_customer?(@customer)
  end

  def admin_customer
      redirect_to(root_url) unless current_customer.admin?
  end

end
