require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
  	@user = User.new(name: "GIANNI")
  end

  test "users can login and get a show page" do
  	get signup_path
  	assert_difference "User.count", 1 do 
	  	post signup_path, params: { user: { name: @user.name } }
  	end
  	follow_redirect!
  	assert_select "h1", "Page for: #{@user.name}"
  end
end

# You'll need to make a form 
# where you can sign up a new user 
# and a simple `#show` page.