module SessionsHelper

	def log_in(customer)
    session[:customer_id] = customer.id
  end

  def current_customer?(customer)
    customer == current_customer
  end

  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id])
  end

  def logged_in?
    !current_customer	.nil?
  end

  def log_out
    session.delete(:customer_id)
    @current_customer = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
