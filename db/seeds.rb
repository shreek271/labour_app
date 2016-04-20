Customer.create!(name: "abc kumar", email: "abc@abc.com", 
  							 dob: "12-12-2000", gender: "male", country: "somalia",
  							 password: "foobar", password_confirmation: "foobar",
  							 admin: true,
  							 activated: true,
             activated_at: Time.zone.now)
