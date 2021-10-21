def create_test_user
  @test_name = 'John Wayne'
  @test_email = 'john.wayne@yeehaw.com'
  @test_password = 'Cactus123'
end

def sign_up_test_user
  visit('/sign-up')
  fill_in 'name', with: @test_name
  fill_in 'email', with: @test_email
  fill_in 'password', with: @test_password
  click_button 'Sign Up'
end

def create_and_sign_up_test_user
  create_test_user
  sign_up_test_user
end
