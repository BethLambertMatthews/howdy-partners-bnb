feature 'New user signup: ' do
  scenario 'new user can sign up for an account' do
    visit('/sign-up')
    fill_in 'name', with: 'John Wayne'
    fill_in 'email', with: 'john.wayne@yeehaw.com'
    fill_in 'password', with: 'Cactus123'
    click_button 'Sign Up'
    expect(page).to have_current_path('/')
  end
end