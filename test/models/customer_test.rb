require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def setup
  	@customer = Customer.new(name: "abc kumar", email: "abc@abc.com", 
  							 dob: "12-12-2000", gender: "male", country: "somalia",
  							 password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
  	assert @customer.valid?
  end

  test "should be valid name" do
  	@customer.name = " "
  	assert_not @customer.valid?
  end

  test "should be valid email" do
  	@customer.email= " "
  	assert_not @customer.valid?
  end

  test "should be valid dob" do
  	@customer.email = " "
  	assert_not @customer.valid?
  end

  test "should be valid gender" do
  	@customer.gender = " "
  	assert_not @customer.valid?
  end

  test "should be valid country" do
  	@customer.country = " "
  	assert_not @customer.valid?
  end

  test "name should not be too long" do
  	@customer.name = "a" * 26
  	assert_not @customer.valid?
  end

  test "email should not be too long" do
  	@customer.email = "a" * 24 + "@abc.com"
  	assert_not @customer.valid?
  end

  test "valid email format" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @customer.email = invalid_address
      assert_not @customer.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
  	duplicate_customer = @customer.dup
  	duplicate_customer.email = @customer.email.upcase
  	@customer.save
  	assert_not duplicate_customer.valid?
  end

  test "should be present" do
  	@customer.password = @customer.password_confirmation = " " * 6
  	assert_not @customer.valid?
  end

  test "should be minimum" do
  	@customer.password = @customer.password_confirmation = "a" * 5
  	assert_not @customer.valid?
  end

end