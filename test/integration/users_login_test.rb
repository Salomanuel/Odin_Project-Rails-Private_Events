require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users[:manuel]
	end
	
	test "should login and logout" do
		get root_path
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path, count: 0
		assert_select "a[href=?]", user_path(@user), count: 0
		# wrong login
		# good login
		get login_path
		post login_path, params: { user: { name: @user.name } }
		assert_redirected_to @user
		follow_redirect!
		assert is_logged_in?
		assert_select "a[href=?]", login_path, 	count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path(@user)
		# logout
		delete logout_path
		assert redirected_to root_path
		follow_redirect!
		assert_not is_logged_in?
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path,	count: 0
		assert_select "a[href=?]", user_path(@user),		count: 0
	end
end


# Create a simple sign in function 
# that doesn't require a password -- 
# just enter the ID or name of the user you'd 
# like to "sign in" as and click Okay. 
# You can then save the ID of the "signed in" 
# user in either 
# the `session` hash or 
# the `cookies` hash 
# and retrieve it when necessary. 
# It may be helpful to always display the name 
# of three "signed in" user at the top.