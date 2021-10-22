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

def log_user_in
  visit('/login')
  fill_in 'email', with: "john.wayne@yeehaw.com"
  fill_in 'password', with: "Cactus123"
  click_button 'Log in'
end

def visit_more_details_page
  visit('/')
  click_link('view_details_1')
  expect(page).to have_current_path '/listing-details/1'
end
