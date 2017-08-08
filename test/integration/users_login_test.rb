require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

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
# of the "signed in" user at the top.