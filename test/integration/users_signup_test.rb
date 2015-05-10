require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
 test "invalid signup information" do
   get signup_path
   assert_difference 'User.count', 1 do
     post_via_redirect users_path, user: { name: "testuser2",
                              email: "test2@test.ie",
                              password: "okjokj",
                              password_confirmation: "okjokj" }
  end
  assert_template 'users/show'
  assert is_logged_in?
 end
end
