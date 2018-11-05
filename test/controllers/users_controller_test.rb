require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  #Test de sign up

  def setup
    @user = User.create(first_name: 'Prénom', last_name: 'Nom', email: 'email@example.com', password: 'MDPquitue', password_confirmation: 'MDPquitue')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'first name cant be blank' do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test 'last name cant be blank' do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test 'email must be unique' do
    duplicate_email = @user.dup
    assert_not duplicate_email.valid?
  end

end
