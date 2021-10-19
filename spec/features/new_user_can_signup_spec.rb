feature 'New user signup: ' do
  scenario 'new user can sign up for an account' do
    test_name = 'John Wayne'
    test_email = 'john.wayne@yeehaw.com'
    test_password = 'Cactus123'
    
    expect(User).to receive(:create_user).with(test_name, test_email, test_password)

    visit('/sign-up')
    fill_in 'name', with: test_name
    fill_in 'email', with: test_email
    fill_in 'password', with: test_password
    
    click_button 'Sign Up'
    expect(page).to have_current_path('/')

  end
end
