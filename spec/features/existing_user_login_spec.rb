feature 'Existing user login: ' do
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
end
  