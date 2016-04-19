require 'test_helper'

class CustomersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Customer.count' do
      post customers_path, customer: { name:  "", email: "user@invalid", 
      	                               dob: "12-01-1992", gender: "male",
      	                               country: "india",
                               password: "foobar", password_confirmation: "barfoo" }
    end
    assert_template 'customers/new'
  end
end
