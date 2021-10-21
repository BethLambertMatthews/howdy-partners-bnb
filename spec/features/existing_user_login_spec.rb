feature 'Existing user login: ' do

  scenario 'when they visit the login page' do
    visit ('/login')
    expect(page).to have_content("Sign up here")
    click_link('here')
    expect(page).to have_current_path('/sign-up')
  end
    
  scenario 'existing user can log in to their account' do
    test_email = 'kingcowboydylan@yeehaw.com'
    test_password = 'buckar00'
    expect(User).to receive(:log_in).with(test_email, test_password)
  
    visit('/login')
    fill_in 'email', with: test_email
    fill_in 'password', with: test_password
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end

  scenario 'flash alert appears when user not found in database' do
    test_email = 'kingcowboy@com'
    test_password = 'buck'
    expect(User).to receive(:log_in).with(test_email, test_password).and_return("This user does not exist")

    visit('/login')
    fill_in 'email', with: test_email
    fill_in 'password', with: test_password
    click_button 'Log in'
    expect(page).to have_current_path('/login')
    expect(page).to have_content("Sorry, we didn't recognise those details. Please try again.")
  end

end
  