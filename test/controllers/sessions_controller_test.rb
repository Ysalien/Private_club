require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @userone = User.create(id: 1, first_name:'First', last_name:'Last', email: 'example@example.com', password:'password', password_confirmation: "password")
    @usertwo = User.create(id: 2, first_name:'First_name', last_name:'Last_name', email: 'example2@example.com', password:'password2', password_confirmation: "password2")
  end

 test "should redirect update when logged in as wrong user" do
   get session_path(@userone)
   patch session_path(@usertwo), params: { user: { first_name: @usertwo.first_name, last_name: @usertwo.last_name, email: @usertwo.email, password: @usertwo.password, password_confirmation: @usertwo.password_confirmation } }
   assert_redirected_to login_path
 end

end
