require 'web_helpers'
require 'setup_test_database'

feature 'Existing user login: ' do

  scenario 'when they visit the login page' do
    visit ('/login')
    expect(page).to have_content("Sign up here")
    click_link('here')
    expect(page).to have_current_path('/sign-up')
  end
    
  scenario 'existing user can log in to their account' do
    create_test_user
    add_test_user_to_database

    visit('/login')
    fill_in 'email', with: @test_email
    fill_in 'password', with: @test_password
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end

  scenario 'flash alert appears when user not found in database' do
    # user is not created or added to test db
    visit('/login')
    fill_in 'email', with: "unknown@email.com"
    fill_in 'password', with: "password"
    click_button 'Log in'
    expect(page).to have_current_path('/login')
    expect(page).to have_content("Sorry, we didn't recognise those details. Please try again.") 
  end

end
  